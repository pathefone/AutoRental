page 50114 "Finished Auto Rent Line"
{
    PageType = ListPart;
    UsageCategory = None;
    SourceTable = "Finished Auto Rent Line";
    Caption = 'Finished Auto Rent Line';

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
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Quantity"; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Price"; Rec.Price)
                {
                    ApplicationArea = All;
                }
                field("Sum"; Rec.Sum)
                {
                    ApplicationArea = All;
                }
            }

        }


    }
}




page 50113 "Finished Auto Rent Header Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Finished Auto Rent Header";
    Caption = 'Finished Auto Rent Header Card';


    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                }
                field("Driver License"; Rec."Driver License")
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
            group("Finished Rent Line")
            {
                part("Finished Auto Rent Line"; "Finished Auto Rent Line")
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
}


