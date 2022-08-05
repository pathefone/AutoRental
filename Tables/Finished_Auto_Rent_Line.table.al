table 50110 "Finished Auto Rent Line"
{
    DataClassification = CustomerContent;
    Caption = 'Finished Auto Rent Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            Editable = false;
        }
        field(10; "Row No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Row No.';
            Editable = false;
        }
        field(11; "Main Line"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Main Line';
        }
        field(12; "Type"; Enum "Auto Rent Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Auto Rent Type';
            Editable = false;
        }
        field(13; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            Editable = false;
        }
        field(14; "Description"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
            Editable = false;
        }
        field(15; "Quantity"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity';
            Editable = false;
        }
        field(16; "Price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Price';
            Editable = false;
        }
        field(17; "Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sum';
            Editable = false;
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