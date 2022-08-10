page 50112 "Finished Auto Rent Header List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Finished Auto Rent Header";
    Caption = 'Finished Auto Rent';

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
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
                RunObject = page "Finished Auto Rent Header Card";
                RunPageLink = "No." = field("No.");

            }
        }
    }

}