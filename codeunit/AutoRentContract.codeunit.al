codeunit 50101 "Auto Rent Contract"
{

    procedure Release(var RentContract: Record "Auto Rent Header")
    begin
        RentContract.TestField("Reservation From");
        RentContract.TestField("Reservation To");
        RentContract.TestField("Sum");
        RentContract.Status := "Auto Rent Status"::Released;
        RentContract.Modify();
    end;

    procedure Open(var RentContract: Record "Auto Rent Header")
    begin
        RentContract.Status := "Auto Rent Status"::Open;
        RentContract.Modify();
    end;
}