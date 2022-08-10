page 50108 "Auto Rent Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Rent Header";
    Caption = 'Auto Rent';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;


                    trigger OnValidate()
                    var
                        AutoRentContract: Codeunit "Auto Rent Contract";
                    begin
                        AutoRentContract.Open(Rec);
                    end;
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                }
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                }
                field("Reservation From"; Rec."Reservation From")
                {
                    ApplicationArea = All;
                }
                field("Reservation To"; Rec."Reservation To")
                {
                    ApplicationArea = All;
                }
                field("Sum"; Rec."Sum")
                {
                    ApplicationArea = All;
                }
                field("Status"; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Open Rental Card")
            {
                ApplicationArea = All;
                RunObject = page "Auto Rent Header Card";
                RunPageLink = "No." = field("No.");

            }
        }
    }

}