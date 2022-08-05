table 50106 "Auto Damage"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Damage';

    fields
    {
        field(1; "Row No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Row No.';
        }
        field(10; "Auto No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Auto No.';
            TableRelation = Auto;
        }
        field(11; "Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Date';
        }
        field(12; "Description"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(13; "Status"; Enum "Auto Damage Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }
    }

    keys
    {
        key(Key1; "Row No.", "Auto No.")
        {
            Clustered = true;
        }
    }



}