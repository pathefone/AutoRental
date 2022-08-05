page 50103 "Auto Card"
{
    PageType = Card;
    UsageCategory = None;
    SourceTable = Auto;
    Caption = 'Auto';

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No. Series"; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Auto Name"; Rec."Auto Name")
                {
                    ApplicationArea = All;
                }
                field("Auto Mark"; Rec."Auto Mark")
                {
                    ApplicationArea = All;
                }
                field("Auto Model"; Rec."Auto Model")
                {
                    ApplicationArea = All;
                }
                field("Year of production"; Rec."Year of production")
                {
                    ApplicationArea = All;
                }
                field("Civil Insurance Validity"; Rec."Civil Insurance Validity")
                {
                    ApplicationArea = All;
                }
                field("Tech Inspection Validity"; Rec."Tech Inspection Validity")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Rental Service"; Rec."Rental Service")
                {
                    ApplicationArea = All;
                }
                field("Rental Price"; Rec."Rental Price")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    var
        myInt: Integer;
}