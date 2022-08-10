page 50115 "Auto Rent Damage"
{
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Auto Rent Damage";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;

                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;

                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;

                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;

                }
            }
        }
    }




    var
        isEditable: Boolean;
}

page 50111 "Auto Rent Line"
{
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Auto Rent Line";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Price"; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field("Sum"; Rec."Sum")
                {
                    ApplicationArea = All;
                }
            }

        }

    }
    trigger OnAfterGetCurrRecord()
    var
        AutoRentHeader: Record "Auto Rent Header";
    begin
        if Rec."Main Line" = true then
            isEditable := false
        else
            isEditable := true;

        AutoRentHeader.Get(Rec."Document No.");

        if AutoRentHeader.Status = AutoRentHeader.Status::Released then
            isEditable := false

    end;


    var
        isEditable: Boolean;
}




page 50109 "Auto Rent Header Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Auto Rent Header";


    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Driver License"; Rec."Driver License")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Reservation From"; Rec."Reservation From")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Reservation To"; Rec."Reservation To")
                {
                    ApplicationArea = All;
                    Editable = isEditable;
                }
                field("Sum"; Rec."Sum")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Rent Contract Warehouse"; Rec."Rent Contract Warehouse")
                {
                    ApplicationArea = All;
                }
            }
            group("Rent Line")
            {
                part("Auto Rent Line"; "Auto Rent Line")
                {
                    SubPageLink = "Document No." = field("No.");
                }
            }
            group("Auto Damage")
            {
                part("Auto Rent Damage"; "Auto Rent Damage")
                {
                    SubPageLink = "Document No." = field("No.");
                }
            }
        }
        area(FactBoxes)
        {
            part("Driver License Picture"; "Driver License")
            {
                Caption = 'Driver license';
                SubPageLink = "No." = field("No.");
            }
        }
    }


    actions
    {
        area(Processing)
        {
            action("Release")
            {
                ApplicationArea = All;
                Caption = 'Release';

                trigger OnAction()
                var
                    AutoRentContract: Codeunit "Auto Rent Contract";
                    ItemJournalTransfer: Codeunit "Item Journal Transfer";
                    Auto: Record Auto;
                begin
                    Auto.Get(Rec."Auto No.");
                    ItemJournalTransfer.TransferItem(Rec, Rec."Rent Contract Warehouse", Auto."Location Code");
                    AutoRentContract.Release(Rec);
                    isEditable := false;
                end;
            }
            action("Return Car")
            {
                ApplicationArea = All;
                Caption = 'Return Car';

                trigger OnAction()
                var
                    FinishedAutoRentHeader: Record "Finished Auto Rent Header";
                    FinishedAutoRentLine: Record "Finished Auto Rent Line";
                    AutoRentLine: Record "Auto Rent Line";
                    AutoRentDamage: Record "Auto Rent Damage"; //Temporate rent auto damage
                    AutoDamage: Record "Auto Damage"; //Auto history damage
                    ItemJournalTransfer: Codeunit "Item Journal Transfer"; //For Item Transfer
                    Auto: Record Auto;
                    AutoDamageNo: Codeunit "Auto Damage No";
                begin
                    //Transfer Item back to Rental Warehouse
                    Auto.Get(Rec."Auto No.");
                    ItemJournalTransfer.TransferItem(Rec, Auto."Location Code", Rec."Rent Contract Warehouse");

                    //Transfer Auto Rent Header data to Finished Auto Rent Header
                    FinishedAutoRentHeader.Init();
                    FinishedAutoRentHeader.TransferFields(Rec);
                    FinishedAutoRentHeader."Sum" := Rec."Sum";

                    if not FinishedAutoRentHeader.Insert() then
                        Message(AutoDataErrLbl);

                    //Transfer Auto Rent Line data to Finished Auto Rent Line
                    AutoRentLine.SetRange("Document No.", Rec."No.");
                    if AutoRentLine.FindSet() then
                        repeat
                            FinishedAutoRentLine.Init();
                            FinishedAutoRentLine.TransferFields(AutoRentLine);

                            if not FinishedAutoRentLine.Insert() then
                                Message(AutoDataErrLbl);
                            AutoRentLine.Delete();

                        until AutoRentLine.Next() = 0;

                    // Transfer Auto Damage after returning a car
                    AutoRentDamage.SetRange("Document No.", Rec."No.");
                    //AutoDamage.Init();
                    if AutoRentDamage.FindSet() then
                        repeat
                            AutoDamage."Auto No." := Rec."Auto No.";
                            AutoDamage."Line No." := AutoDamageNo.GetNextRowNo(Rec."Auto No.");
                            AutoDamage."Date" := AutoRentDamage."Date";
                            AutoDamage.Description := AutoRentDamage.Description;
                            AutoDamage.Status := AutoDamage.Status::Active;

                            if not AutoDamage.Insert() then
                                Message(AutoDamageErrLbl);
                            AutoRentDamage.Delete();

                        until AutoRentDamage.Next() = 0;
                    Rec.Delete();
                end;
            }
            action("Generate Rent Card Report")
            {
                ApplicationArea = All;
                Caption = 'Generate Rent Card Report';

                trigger OnAction()
                var
                    AutoRentHeader: Record "Auto Rent Header";
                begin
                    AutoRentHeader.Get(Rec."No.");
                    AutoRentHeader.SetRecFilter();
                    Report.RunModal(Report::"Auto Rent Card Report", true, true, AutoRentHeader);
                end;

            }
        }
    }


    //Insert first field in Auto Rent Line as Auto Rental service
    trigger OnAfterGetRecord()
    var
        Auto: Record Auto;
        Resource: Record Resource;
        AutoRentLine: Record "Auto Rent Line";
    begin
        AutoRentLine.SetRange("Line No.", 1);
        AutoRentLine.SetRange("Document No.", Rec."No.");
        if not AutoRentLine.FindSet() then begin
            AutoRentLine.Reset;
            AutoRentLine.Init();
            AutoRentLine."Document No." := Rec."No.";
            AutoRentLine."Line No." := 1;
            AutoRentLine."Main Line" := true;
            AutoRentLine."Type" := AutoRentLine."Type"::Resource;
            Auto.Get(Rec."Auto No.");
            Resource.Get(Auto."Rental Service");
            AutoRentLine."No." := Resource."No.";
            AutoRentLine.Description := Resource.Name;
            AutoRentLine.Quantity := 1;
            AutoRentLine.Price := Resource."Unit Price";
            AutoRentLine."Sum" := AutoRentLine.Price * AutoRentLine.Quantity;
            if not AutoRentLine.Insert() then
                Message(AutoRentErrLbl);
        end;
    end;


    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            isEditable := false
        else
            isEditable := true;
    end;





    var
        isEditable: Boolean;
        AutoDamageErrLbl: Label 'Could not insert auto damage data';
        AutoDataErrLbl: Label 'Could not insert auto data';
        AutoRentErrLbl: Label 'Could not insert initial auto resource line';
}


