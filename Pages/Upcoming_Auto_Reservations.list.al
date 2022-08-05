page 50106 "Upcoming Auto Reservations"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Auto Reservation";
    Caption = 'Upcoming Auto Reservations';
    
    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Auto No."; Rec."Auto No.")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Row No."; Rec."Row No.")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Client No."; Rec."Client No.")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Reservation From"; Rec."Reservation From")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field("Reservation To"; Rec."Reservation To")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
            }
        }
    }

        trigger OnOpenPage()
        var
            NoReservationsMsg: Label 'No upcoming reservations found!';
        begin
            //Rec.SetRange("Reservation From", System.Today());
            Rec.SetFilter("Reservation From", '>%1', System.Today());
            if not Rec.FindSet() then
                Message(NoReservationsMsg);
        end;
    

}