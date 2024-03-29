table 50105 "Auto Reservation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
        }
        field(10; "Auto No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            TableRelation = Auto;
        }
        field(11; "Client No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Client No.';
            TableRelation = Customer;
        }
        field(12; "Reservation From"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation From';

            trigger OnValidate()
            begin
                if Rec."Reservation From" <> 0D then
                    ValidateReservationDate();
            end;
        }
        field(13; "Reservation To"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation To';

            trigger OnValidate()
            begin
                if Rec."Reservation To" <> 0D then
                    ValidateReservationDate();
            end;
        }
    }

    keys
    {
        key(Key1; "Line No.", "Auto No.")
        {
            Clustered = true;
        }
    }


    procedure ValidateReservationDate()
    var
        AutoReservation: Record "Auto Reservation";
        DateErr: Label 'This date is already reserved!';
    begin

        AutoReservation.SetFilter("Reservation From", '<=%1', Rec."Reservation From");
        AutoReservation.SetFilter("Reservation To", '>=%1', Rec."Reservation From");
        if AutoReservation.FindSet() then
            Error(DateErr);

        AutoReservation.Reset();
        AutoReservation.SetFilter("Reservation From", '<=%1', Rec."Reservation To");
        AutoReservation.SetFilter("Reservation To", '>=%1', Rec."Reservation From");
        if AutoReservation.FindSet() then
            Error(DateErr);
    end;

}