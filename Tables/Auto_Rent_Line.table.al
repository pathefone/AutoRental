table 50108 "Auto Rent Line"
{
    DataClassification = CustomerContent;
    Caption = 'Auto Rent Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Document No.';
            TableRelation = "Auto Rent Header";
            Editable = false;
        }
        field(10; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Line No.';
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
            Caption = 'Type';
        }
        field(13; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            TableRelation =
                if ("Type" = const(Item)) Item
            else
            if ("Type" = const(Resource)) Resource;

            trigger OnValidate()
            begin
                GetData();
            end;
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

            trigger OnValidate()
            begin
                GetSum();
            end;
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
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        AutoRentLine: Record "Auto Rent Line";
    begin
        AutoRentLine.SetRange("Document No.", Rec."Document No.");

        if not AutoRentLine.FindLast() then
            AutoRentLine.Init()
        else
            Rec."Line No." := AutoRentLine."Line No." + 10000;
    end;

    local procedure GetData()
    begin
        if (Rec."Type" = Rec."Type"::Item) then begin
            Item.Get(Rec."No.");
            Rec.Price := Item."Unit Price";
            Rec.Description := Item.Description;
        end
        else begin
            Resource.Get(Rec."No.");
            Rec.Price := Resource."Unit Price";
            Rec.Description := Resource.Name;
        end;
    end;

    local procedure GetSum()
    begin
        Rec."Sum" := Rec.Quantity * Rec.Price;
    end;


    var
        Item: Record Item;
        Resource: Record Resource;

}