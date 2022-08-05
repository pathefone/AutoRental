table 50100 "Auto Rent Damage"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Rent Damage';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
        }
        field(10; "Row No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Row No.';
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
    }

    keys
    {
        key(Key1; "Document No.", "Row No.")
        {
            Clustered = true;
        }
    }



}