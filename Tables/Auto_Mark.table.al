table 50101 "Auto Mark"
{
    Caption = 'Auto Mark';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Code';
        }
        field(10; "Description"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }


    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}