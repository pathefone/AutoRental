page 50104 "Auto List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Auto;
    Caption = 'Auto';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
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
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Auto Rent History Report")
            {
                ApplicationArea = All;
                Caption = 'Generate Auto Rent History';


                trigger OnAction()
                var
                    Auto: Record Auto;
                begin
                    Auto.Get(Rec."No.");
                    Auto.SetRecFilter();
                    Report.RunModal(Report::"Auto Rent History", true, true, Auto);
                end;
            }
        }
    }
}