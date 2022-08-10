table 50109 "Finished Auto Rent Header"
{
    DataClassification = ToBeClassified;
    Caption = 'Finished Auto Rent Header';

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }
        field(10; "Client No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Client No.';
            Editable = false;
        }
        field(11; "Driver License"; Media)
        {
            DataClassification = CustomerContent;
            Caption = 'Driver License';
        }
        field(12; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
            Editable = false;
        }
        field(13; "Auto No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            Editable = false;
        }
        field(14; "Reservation From"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation From';
            Editable = false;
        }
        field(15; "Reservation To"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Reservation To';
            Editable = false;
        }
        field(16; "Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sum';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }


}