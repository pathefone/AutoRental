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

        }
        field(10; "Row No."; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Row No.';
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
                GetPrice();
                GetDescription();
            end;
        }
        field(14; "Description"; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
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
        }
        field(17; "Sum"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Sum';
        }

    }

    keys
    {
        key(Key1; "Document No.", "Row No.")
        {
            Clustered = true;
        }
    }

    local procedure GetPrice()
    begin
        if (Rec."Type" = Rec."Type"::Item) then begin
            Item.Get(Rec."No.");
            Rec.Price := Item."Unit Price";
        end
        else begin
            Resource.Get(Rec."No.");
            Rec.Price := Resource."Unit Price";
        end;
    end;

    local procedure GetDescription()
    begin
        if (Rec."Type" = Rec."Type"::Item) then begin
            Item.Get(Rec."No.");
            Rec.Description := Item.Description;
        end
        else begin
            Resource.Get(Rec."No.");
            Rec.Description := Resource.Name;
        end;
        //could not find descr
    end;

    local procedure GetSum()
    begin
        Rec."Sum" := Rec.Quantity * Rec.Price;
    end;


    var
        Item: Record Item;
        Resource: Record Resource;

}