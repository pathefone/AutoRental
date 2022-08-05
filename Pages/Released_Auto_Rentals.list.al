page 50110 "Released Auto Rentals"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Header";
    Caption = 'Released Auto Rentals';
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Reservation From"; Rec."Reservation From")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Reservation To"; Rec."Reservation To")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sum"; Rec."Sum")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
        area(Factboxes)
        {
            
        }
    }

    trigger OnOpenPage()
    var
        NotFoundLbl: Label 'No data has been found.';
    begin
        Rec.SetFilter(Status, '=%1', Rec.Status::Released);
        if not Rec.FindSet() then
            Message(NotFoundLbl);
    end;
}