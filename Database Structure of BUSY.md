**Busy**

# **Database Structure of BUSY**

In this document we are going to discuss about the database structure of BUSY. In a business application, Back-end is used to store the data entered by the user through Front-end. For storage of information, database used in BUSY is MS Access or MS SQL Server. Basically, business applications are based on two entities. The entities are:

- Master Entity
- Transaction Entity

As BUSY is a business application, it is also based on the two above-mentioned entities. Before proceeding further, let us discuss the basic concept of Master and Transactions entities.

**Master Entity**

Master entities are created once and stores information that is either static or that seldom gets changed such as Name, Address, TIN Number and so on. Informationentered in Master entities does not change a great deal and is used further in transactions. Let us understand the concept of Master entities in BUSY with the help of an example. Smart clothing, a garment manufacturing company, creates a party named Rich Styles and enters its address, TIN No. and other company information in the_Account_ master. As the information regarding the details of the company rarely changes hence we can refer to it as Master information and _Account_ master as Master Entity.

**Transaction Entity**

Transactions are day-to-day entries and have a great deal of activity in them. Transactions entities require frequent posting of records and need regular updations and insertions. Let us understand the concept of Transactions entity with the help of above example. Smart Clothing Company sells goods to Rich Styles Company on regular basis and records these transactions in the _Sales_ voucher. As sales of goods is an ongoing process hence we can refer the recording of sales in _Sales_ voucher as transactions and _Sales_ voucher as Transaction entity.

Let us now discuss about the databases and the tables used for storage and retrieval of information in BUSY.

Whenever you create a new company in BUSY, two databases are created. One database is a common database that stores information that is not year specific and other database has the Beginning Financial year appended to its name and stores year specific information. Each time, you switch to a new financial year in the company; a new database is created with the current year appended to its name. Hence the two types of database used in BUSY are:

- Year Specific Database
- Common Database

Let us first discuss about the tables that are used in Year specific Database.

**Year Specific Database**

In the Year Specific database there are three types of tables. We have classified these tables according to the entities for which they are used. The three types of tables are:

1. Master Entity Tables
2. Transaction Entity Tables
3. Common Tables

Let us discuss these tables in detail.

**1. Master Entity Tables**

All the masters created in BUSY such as Account, Item, Cost Centre and so on can be referred to as Master entities. Tables that are used for storing and retrieving information about the Master entities are:

- Master1
- MasterSupport
- Help1
- MasterAddressInfo
- Folio1

Let us discuss these tables in detail.

**Master 1**

Whenever you create a new master, an entry is inserted in the _Master1_ table. A single row is inserted in _Master1_ table for each master. Some of the important fields of the Master1 table are:

- Code – This is a unique code given to each master being created. This code is not displayed to the user and is used for maintaining uniqueness of the records. This is the primary key of the table.
- Master Type – Each master has a fixed MasterType. The values to be inserted in Master Types are picked from _GlobalConst.bas_ file.
- Name
- Alias
- ParentGrp
- PrintName
- Stamp – This field is useful in Multi-user mode to avoid data concurrency problem. It implies that if two users read the same data at the same time, perform some modifications in the data and one of them saves the modified work before the other user, then the second user should not be able to save the modifications to data read by him. Second user can modify the data only when he reads the data again from the database and performs the modification in the newly updated data. Initially when a master is created it is given the _Stamp_ value as 1 and whenever any modifications are made in this master its value is incremented by 1. Let us understand this concept with the help of an example. A user named _User1_ has opened an _Account_ master _Cash In Hand_ and is doing some modification work. At the same time _User2_ also opens the same account and starts doing the modification work. This time both the users have _Stamp_ value as 1. Now _User1_ saves the modified work and the value of stamp gets incremented by 1 and becomes 2. At this time when _User2_ wants to save the modified work, he will not be able to do so as the value of _Stamp_ that he holds and the one stored in the database are different.
- Creation Date
- CreatedBy – It stores the name of the user by whom the master is created.
- ModificationTime – It stores the date and time on which the last modification took place.
- ModifiedBy – It stores the name of the user by whom the record was last modified.

**MasterSupport**

_MasterSupport_ table acts as a child table to _Master1_ table. To maintain Second Normal Form or we can say to avoid data redundancy this table is created. Let us understand the need for this table with the help of an example. A user has created a _TDS Category_ master named _Winning From Game Shows_. With this _TDS Category_ master he has defined five _Payee Categories_ having different _Threshold __Limit_, _TDS%_, _Surcharge%_ and _Cess%_. Now a single row will be created in the _Master1_ table and corresponding five rows will be created in _MasterSupport_ table for different _Payee__ Categories_ and their _Threshold limit_, _TDS%_ and so on. Some of the important fields of the _MasterSupport_ table are:

- MasterCode – The code of the master to which the corresponding entry belongs is stored in this field. This is a foreign key with reference to _Master1_ table.
- Date
- MasterType
- CM1-2

**MasterAddressInfo**

All the address related information and the information regarding CST number, LST number, TIN number get stored in the _MasterAddressInfo_ table. For example, while creating a sundry debtor, address, telephone number and so on. of the party will be stored in this table. Some of the important fields of the _MasterAddressInfo_ table are:

- MasterCode
- Address1
- Address2
- CST – It stores the Central Sales Tax number of the party.
- LST – It stores the Local Sales Tax number of the party.
- TinNo – It stores the Tax Identification number of the party.

**Help1**

Whenever a new master is added, its entry is also inserted in _Help1_ table. This table is maintained for faster accessing of records. For example, while viewing the list of sundry debtors, only those masters that fall under _Sundry Debto_r category should be listed. In the Help1 table there is a data field named _RecType_, which stores the category type of master i.e. for all the sundry debtors _RecType_ will be 1, for all sundry creditors _RecType_ will be 2 and so on. Now you can easily specify the query as "select \* from Help1 where RecType= 1". This query will display the records having account group as Sundry Debtor. This can be possible with _Master1_ table, but the result will be very slow.

_ **Note: The value of** _ **RecType** _to be inserted is picked from GlobalConst.bas file._

_Help1_ table stores individual entries for _Name_ and _Alias_ of the Master. This is very useful since while showing the list of masters, we always show the _Name_ followed by _Alias_ in the next line. This is not possible with _Master1_ table. Some of the important fields of the _Help1_ table are:

- RecType – This field stores the code of the master under which the newly created master can be categorised. For example, we have created an account master named _Cash In Hand_. Now this account master can fall under two different groups that are _Current Asset_ and _Cash_. The codes for these two masters in _GlobalConst.bas_ file are 1 and 2 respectively. Now, two entries will be inserted in Help1 table with _RecType_ 1 and 2.
- NameAlias
- Code
- NameOrAlias – This field stores the value as 1 if the value stored in _NameAlias_ field is _Name_ of the master and 2 if the value stored in the _NameAlias_ field is _Alias_ of the master.

**Folio1**

_Folio1_ table is used to maintain records of opening balance of masters. Opening balance can be of an _Account_ master, _Item_ master, _Cost Centre_ master. For example, while creating a new item if you specify opening stock of the item then it will get stored in the _Folio1_ table. Some of the important fields of the _Folio1_ table are:

- Code – This is a foreign key, which has a reference to the _Code_ field of the _Master1_ table.
- D1-150 – These are different fields, which store opening balances and opening stocks of different masters.

**2. Transaction Entity Tables**

All the transactions such as Sale, Sale Return, Stock transfer and so on can be referred to as Transaction entities. Tables that are used to store and retrieve information about transaction entities are:

- Tran1
- Tran2
- Tran3
- Tran4
- Tran5
- Tran6
- Tran7
- Tran8
- Tran9
- Tran10
- DeletedInfo
- OEDDet
- TradingExcise
- VATInfo
- VchOtherInfo
- BillingDet
- Help2

Let us discuss these tables in detail.

**Tran1**

A voucher is divided into three parts. First section is Header that consists of date, Bill No., Party Name. Second section is Body that consists of Item related information such as item description, price, quantity and so on. Third section is footer that contains information about tax, freight and forwarding, discount and so on. _Tran1_ table stores all the information related to the header of a voucher. Some of the important fields of the _Tran1_ table are:

  - VchCode – This is a unique voucher code given to every voucher. This is also the primary key of the table.
  - VchType – Each voucher has a fix voucher type. These voucher types are stored in _GlobalConst.bas_ file from where the values are picked and inserted in this field. For example, a _Sales_ voucher has Voucher Type 9; a _Purchase_ Voucher has a voucher type 2. Now whenever a user adds a _Sales_ voucher then 9 will be inserted in this field.
  - Date
  - VchNo
  - VchSeriesCode
  - AutoVchNo – This field is used for auto generation of voucher numbering.
  - External – It stores the value that whether the voucher is entered through BUSY or any other Add-On.
  - CreatedBy
  - CreationTime
  - AthourisedBy
  - AthourisationTime
  - ModifiedBy - It stores the name of the user by whom the voucher is last modified.
  - ModificationTime – It stores the date and time on which the record was last modified.

**Tran2**

All the information pertaining to the body and footer of the voucher such as item related information or Bill Sundry related information gets stored in this table. Some of the important fields of the _Tran2_ table are:

- RecType – It stores the value that whether the inserted entry holds item related information or bill sundry related information. The values for the _RecType_ are picked from _GlobalConst.bas_ file. For example, if the entry inserted is about the item detail then 1 will be inserted in the _RecType_, if the entry inserted is for bill sundry then 2 will be inserted in the _RecType_ and so on.
- CashFlow – It stores the amount that has flowed in or out.
- ShortNar
- ClrDate

**Tran3**

In _Account_ Master if you specify any references for opening balances, and in _Item_ Master if you specify any batch details then it will get stored in the _Tran3_ table. _Tran3_ table also stores the references belonging to transactions such as bill references. When you enter a voucher, a _Bill-by-bill Adjustment of Amount_ Window appears. Information entered through this window gets stored in _Tran3_ table. Some of the important fields of the _Tran3_ table are:

- RefCode – This is the unique reference code given to each reference being created. It is also the Primary Key of the table.
- RecType
- Method – It stores the method i.e. whether the reference being created is a new reference or adjusted/appended with any previous reference.
- VchCode
- DueDate – It stores the due date of the reference being inserted.
- Status
- Type

**Tran4**

_Tran4_ table is used to maintain details of items such as opening stock in Main Unit/Alternate Unit, opening amount and so on. When you create a new item then a _Material Centre Wise Opening Stock Detail_ window appears. Information entered through this window gets stored in _Tran4_ table. Some of the important fields of the _Tran4_ table are:

- SrNo – It stores the serial number of the item.
- MasterCode1 – It stores the code of the item.
- MasterCode2 – It stores the code of the material centre.
- D1 – It stores the opening stock in main unit.
- D2 – It stores the opening stock in alternate unit.
- D3 – It stores the opening amount.

**Tran5**

_Tran5_ table stores the Cost Centre details. While entering a voucher an _Allocation of Amount To Cost Centre Window_ appears. Information entered through this window gets stored in _Tran5_ table. Some of the important fields of the _Tran5_ table are:

- MasterCode1 – It stores the code of the cost centre.
- TranType – It stores the value for the type of transaction from where the entry has come i.e. whether the entry belongs to _Sales_ voucher, _Purchase_ voucher and so on.
- ShortNar

**Tran 8**

_Tran8_ table stores the information about the _Forms Received_ and _Forms Issued_ documents. It stores only the header information. Some of the important fields of the _Tran8_ table are:

- FormRecDate – It stores the date on which form is received from the authorities.
- FormNo
- AutoVchNo
- CreatedBy
- CreationTime
- AthourisedBy – It stores the name of the Super User.
- AthourisationDate – It stores the date on which Super User has given the authority to other user.
- ModifiedBy
- ModificationTime

**Tran9**

_Tran9_ table acts as a child table to _Tran8_ table. As mentioned above, details related to the _Form Received/Issued_ document or header information gets stored in _Tran8_ table and all the further details related to forms or the footer information get stored in _Tran9_ table. Some of the important fields of the _Tran9_ table are:

- SrNo. – It stores the serial number of the entry.
- Date – It stores the bill date.
- BillCode – It stores the bill code or we can say the voucher number against which the form is issued/received.
- Amount – It stores the amount receivable/issuable.

**DeletedInfo**

_DeletedInfo_ table stores information about the deleted vouchers. The entry in this table will be inserted only when you have enabled the option of _Maintain Data CheckList_ in BUSY. This table is helpful if the company wants to view the details of the deleted vouchers such as the name of the user who has deleted the voucher and so on. Some of the important fields of the _DeletedInfo_ table are:

- Identity – It stores the voucher series, voucher number, voucher date of the deleted voucher.
- DeletedBy
- DeletionTime

**OEDDet**

This table stores other excise details entered through _Sale/Purchase and__Sale/Purchase Return_ vouchers. Some of the important fields of the _OEDDet_ table are:

- OEDRate
- OEDAmount
- CessRate
- CessAmount

**TradingExcise**

This table stores the information about _Trading Excise_. If you specify an opening balance for _Trading Excise_ then it will get stored in this table. At the time of entering a voucher a _RG23D Details_ Window appears. Information entered through this window gets stored in _TradingExcise_ table. Some of the important fields of _TradingExcise_ table are:

- Method
- VchNo
- ItemCode
- AssValue
- DutyRate
- DutyType

**VATInfo**

This table stores information related to _VAT Journal_. Some of the important fields of the _VATInfo_ table are:

- Date
- Amount
- RecType
- SrNo.

**VchOtherInfo**

_VchOtherInfo_ table stores the other related information about the vouchers such as transport details, optional fields and so on. Some of the important fields of the _VchOtherInfo_ table are:

- Transport
- Station
- Form31No
- Form31Issued
- GoodsRemovalTime

**BillingDet**

_BillingDet_ table stores information about the party whose billing details are maintained. While entering a voucher such as _Sale/Purchase_ and so on when you select the name of the _Party_ then a _Billing Details_ window appears. In the window you can enter information about the party with whom you are dealing. The information entered through this window gets stored in the _BillingDet_ table. Some of the important fields of the _BillingDet_ table are:

- VchCode
- PartyName
- Address1

**Help2**

_Help2_ table is maintained for faster accessing of the records. Information regarding optional fields and transport details get stored in this table. If optional fields are defined with any master then while adding a master the details of optional fields also get stored in this table. Some of the important fields of the _Help2_ table are:

- RecType1 – It stores a constant signifying whether it is a master entry or transaction entry.
- RecType2
- RecType3
- Name – It stores the value accordingly.

**ItemDesc**

_ItemDesc_ table stores additional item description given with the item at the time of entering a voucher. While entering a voucher when you select the name of the item an _Item Add. Field/Description_ Window appears. Information provided through the window gets stored in this table. Some of the important fields of the _ItemDesc_ table are:

- VchCode
- SrNo
- Desc1-4

**Excise**

_Excise_ table stores the details of _Adjust Excise Amounts_ document and the details entered about excise duty at the time of entering various vouchers. Some of the important fields of the _Excise_ table are:

- RecType
- VchCode
- DocName
- Value
- Balance
- DateOfDeposit

**STDet**

_STDet_ table stores the details related to Service Tax. While entering a voucher if service tax has been charged/paid on the goods then a _Service Tax Details_ window appears. The information entered through the window gets stored in this table. Some of the important fields of the _STDet_ table are:

- VchCode
- STCategory
- STAssValue
- STRate
- STCessRate

**TDS**

Information related to TDS details get stored in this table. For example, while entering a _Payment_ voucher, if you are debiting a TDS duty account then a _TDS Adjust Reference_ Window appears. The information entered through this window gets stored in this table. Some of the important fields of the _TDS_ table are:

- Method
- RefNo
- RefCode
- MasterCode1
- MasterCode2
- EntryDate
- DateOfCredit
- SurchargeRate
- ChallanNo
- Quarter

**3. Common Tables**

Beside above-mentioned tables there are certain more tables that are not entity specific. We can refer to these tables as common tables. These tables are:

- Tran10
- Config
- RepOptValue
- ExternalData
- Locks

Let us discuss these tables in detail.

**Tran10**

_Tran10_ table is used to store the information about the _Party Item Price Structure_ or _Party Item Discount Structure_. Some of the important fields of the _Tran10_ table are:

- RecType
- MasterCode1
- MasterCode2

**Config**

_Config_ table is used to store information about the different configuration settings specified by the user. For example, the option of _Broker_ appears in BUSY only when you have enabled the option of _Broker-wise Reporting_ in the _Configuration_ menu. Hence, _Config_ serves as a base table from where different values are picked and based on these values different options appear in BUSY. Some of the important fields of the _Config_ table are:

- RecType
- Type
- NoOfFld

**RepOptValue**

_RepOptValue_ table stores the values specified by the user at the time of specifying different options for viewing the reports. The values in this table are maintained only for display purpose. For example, while viewing _Brokerage Calculation_ report, a user specifies the name of the Broker as Rohan, Brokerage% as 10 and so on. Now whenever the user opens a _Brokerage calculation_ report, the same data will be displayed in the _Report options_ Window. Some of the important fields of the _RepOptValue_ table are:

- RepId
- ReportType
- MasterType
- FieldId

**ExternalData**

_ExternalData_ table stores a value to specify as to which Add-On, or external application, the data belongs to. Some of the important fields of _ExternalData_ table are:

- KeyType
- KeyCode
- AppName
- CanEditData
- CanDeleteKey

**Locks**

_Locks_ table is helpful in multi-user mode. In a multi-user environment, if a user is doing data manipulation then _Locks_ table is opened and at that time if any other user wants to do data manipulation then he will not be able to do so. This is because he will find the _Locks_ table opened and no data manipulation is allowed when _Locks_ table is open.

All the tables of Year Specific Database have been explained. Let us now discuss the tables used in Common Database

**Common Database**

Tables under common database store information that is not year specific. Common Database is the database that stores the information common to every financial year. For example, if you create a Standard Narration in a particular financial year then it can be used in any financial year. Hence, we store Standard Narrations in the common database. The tables in the Common Database are:

- Company
- StdNar
- UserLog
- UserPreference
- UserPreference1
- PrinterReps
- ScreenReps

Let us discuss these tables in detail.

**Company**

_Company_ table stores the information related to the company being created. Some of the important fields in the _Company_ table are:

- Name
- Print Name
- Address1-4
- BegFY – It stores the beginning financial year of the company.
- CurFY – It stores the current financial year of the company.
- BooksStart – It store the Books Commencing Date.
- FreezDate – It stores the date up to which the data is frozen.
- LSTNo
- CSTNo
- Created On
- Major
- Minor
- Received

**StdNar**

_StdNar_ table stores the Standard Narrations created in BUSY. Some of the important fields in _StdNar_ table are:

- VchType
- Nar1 – It stores the narration entered.
- Nar2 – If standard narration is created for accounting vouchers such as Payment, Receipt and so on then in BUSY you can specify a narration up to 188 characters. First 94 characters will then be stored in Nar1 field and the rest of the characters will be stored in Nar2 field.

**UserLog**

_UserLog_ table helps in determining whether there is an abnormal termination of program or not. Whenever a user opens a company, an entry is inserted in this table and whenever he closes the company, the entry is deleted from the table. Now if there is an abnormal termination of the program, the entry will not get deleted from this table. Hence, we can trace from which system there was an abnormal termination of program. Some of the important fields of _UserLog_ table are:

- ComputerName
- BUSYUserName
- Date

**UserPreferences**

_UserPreferences_ table stores details regarding the Super User and other users created in the company. For example, modification rights given to the user are stored in this table. Some of the important fields of _UserPreferences_ table are:

- Name – It stores the name of the user.
- SuperUser – It stores name of the Super User.
- CanModifyMaster
- CanModifyVoucher
- CanEditCompany
- DosDrvName
- WinDrvName
- PageLen
- LinesPerPage

**UserPreferences1**

_UserPreferences1_ table stores additional information about the Super User and other users. Some of the important fields of the _UserPreferences1_ table are:

- Name
- C1

**PrinterReps**

_PrinterReps_ table stores details regarding document designing. For example, if you have created different formats to be used at the time of printing then details regarding these formats is stored in _PrinterReps_ table. Some of the important fields of _PrinterRep_ table are:

- RepID – It stores the value to specify the voucher to which the format belongs.
- Name – It stores the name of the format created.
- SubRepID – It stores the value to specify whether the details of the format are for Header, Footer, Body, or Page Settings.
- ScriptLine – It store the script or the designing part of the format.
- SrNo

**ScreenReps**

This table is currently not in use.

After explaining the need and relevance of all the tables used in BUSY, let us now have a look at the different forms, UDTs, classes and tables used at the time of creation of masters. For your convenience all the information is summarized in a tabular form.

| _ **Master Name** _ | _ **Form Name** _ | _ **UDT Name** _ | _ **Class Affected** _ | _ **Tables Affected** _ |
| --- | --- | --- | --- | --- |
| Account Master | frmAccMast | udtAccMast | CAccMast |
1. Master1 - Name, Alias, Parent Group, Creation date, Modification Date etc.
2. Folio1 – Opening Balances, Budgets, Targets etc.
3. MasterAddressInfo – Address, TIN No, CST No, LST No etc.
4. Help1 – Name, Alias
5. Help2 – Optional Fields
6. Tran3 – References of Opening Balances, Broker details, Due Date, Amount etc.

 |
| Account Group Master | frmGrpMast | udtGrpMast | CGrpMast |
1. Master1 – Name, Alias, Parent Group etc.
2. Help1 – Name, Alias
3. Folio1 – Budgets, Targets
 |
| Cost Centre | frmCostCentreMast | udtCostCentreMast | CCostCentreMast |
1. Master1 – Name, Alias, Parent Group etc.
2. Help1 – Name, Alias
3. Folio1 – Opening Balance

 |
| Cost Centre Group | frmGrpMast | udtGrpMast | CGrpMast |
1. Master1 – Name, Alias, Parent Group etc.
2. Help1 – Name, Alias

 |
| Broker | frmBrokerMast | udtBrokerMast | CBrokerMast |
1. Master1 – Name, Alias
2. MasterAddressInfo – Address
3. Help1 – Name, Alias
 |
| Author | frmAuthorMast | udtAuthorMast | CAuthorMast |
1. Master1 – Name, Alias
2. MasterAddressInfo – Address
3. Help1 – Name, Alias
 |
| Std. Narration | frmSNMast | udtSNMast | CSNMast |
1. StdNar – VchType, Narration
 |
| Item | frmItemMast | udtItemMast | CItemMast |
1. Master1 – Name, Alias, Con factor, main unit, alt unit, author (only first author specified), stock valuation method, MRP, Royalty etc.
2. MasterAddressInfo – Item Description, Category wise price, discount, value of optional fields etc.
3. Help1 – Name, Alias
4. Help2 – Optional Fields etc.
5. Tran3 – Batch Number, Material Centre code etc.
6. Tran4 – Opening Stock (Main/Alt), Opening Amount etc.
7. Folio1 – Opening stock qty (main/alt), Opening Stock amount etc.
8. MasterSupport – Author (if more than one author is specified then it insert data from second author onwards), royalty etc.
 |
| Item Group | frmGrpMast | udtGrpMast | CGrpMast |
1. Master1 – Name, Alias, Parent Group etc.
2. Help1 – Name, Alias

 |

| Material Centre | frmMCMast | udtMCMast | CMCMast |
1. Master1 – Name, Alias, Group etc.
2. MasterAddressInfo – Address etc.
3. Help1 – Name, Alias
4. Help2 - Optional fields etc.

 |
| --- | --- | --- | --- | --- |
| Material Centre Group | frmGrpMast | udtGrpMast | CGrpMast |
1. Master1 – Name, Alias, Group
2. Help1 – Name, Alias

 |
| Bill Sundry | frmBSMast | udtBSMast | CBSMast |
1. Master1 – Name, Alias, Print Name, Sales/Purchase Account Code, Percentage of Amount etc.
2. Help1 – Name, Alias
 |
| Bill of Material | frmBOMMast | udtBOMMast | CBOMMast |
1. Master1 – Name, Item, Unit, quantity etc.
2. Help1 – Name, Alias
3. MasterSupport – Raw Material Used, Items Generated, Item Type etc.
 |
| ST Form | frmFormMast | udtFormMast | CFormMast |
1. Master1 – Name, Print Name etc.
2. Help1 – Name, Alias
 |
| Sale Type | frmSTMast | udtSTMast | CSTPTMast |
1. Master1 – Name, Sales account code, Form Receivable, Form Issuable, Tax Bill Sundry, Tax% etc.
2. Help1 – Name, Alias
 |
| Purchase Type | frmPTMast | udtPTMast | CSTPTMast |
1. Master1 – Name, Purchase Account Code, Form Receivable, Form Issuable, Tax Bill Sundry, Tax% etc.
2. Help1 – Name, Alias
 |
| TDS Category | frmTDSMast | udtTDSMast | CTDSMast |
1. Master1 – Name, Section Code
2. Help1 - Name
3. MasterSupport – Threshold limit, Payee Category, TDS%, CESS%, Surcharge% etc.
 |

Let us now look at different forms, UDTs, classes and tables used at the time of various transactions.

| _ **Voucher Name** _ | _ **Form Name** _ | _ **UDT** _ | _ **Class Affected** _ | _ **Tables Affected** _ |
| --- | --- | --- | --- | --- |
| Sales Order | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Type, Stock Updation Date, Voucher Number, Voucher Series Code, Party Code etc.
2. Tran2 – Voucher Number, Voucher Series Code, Item Code, Quantity in Main/Alt Unit, percentage on which amount is to be calculated, Nett amount etc.
3. Tran3 – Reference Code, Method, Due Date, Reference Number, Reference Status etc.
4. VchOtherInfo – Voucher Code, Optional fields (1-10), Narration etc.
5. ItemDesc – Voucher Code, Serial Number, Item Description (1-4)
6. Help2 – Optional Field number, Series Code, Optional Field value
 |
| Purchase Order | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Code, Voucher Type, Date, Stock Updation Date, Created By, Last Modification Date etc.
2. Tran2 – Voucher Code, Voucher Number, Date, Percentage value etc
3. Tran3 – Reference Type, Method, Reference Number/Status etc.
4. VchOtherInfo – Optional Fields (1-10), Quantity etc.
5. ItemDesc – Item Description (1-4)
6. Help2 – Voucher Series, Optional field Number/ Value etc.
 |
| Sale | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Type/Number/Series Code, Stock Updation Date, Sale Type Code, Form Received/Issued– Status /Code/ Amount, Excise – Applicable / Value/ Type, Broker Code etc.
2. Tran2 – Material Centre Code, Bill Sundry Master Code, Account Master Code, Cash Flow, Item Additional Info, Opening Balance amount etc.
3. Tran3 – Reference Code, Method, Due Date, Broker Number, Item Code etc.
4. Tran5 – Voucher code/ Type/ Series Code, Cost Centre Code, Serial Number, Short Narration etc.
5. VchOtherInfo – Voucher Code, Optional Fields (1-10), Transport Details, Goods Removal Time, Invoice Preparation Time, Total Quantity etc.
6. OEDDet – Other Excise Duty Rate/ Amount etc.
7. ItemDesc – Serial Number, Item Description (1-4) etc.
8. Help2 – Series Code, Optional Field Number/ Value etc.
9. Folio1
10. Excise – BED/AED Amount, balances etc.
11. BillingDet – Voucher Code, Party Name, Address (1-4)
12. STDet – Voucher Code, Service Tax Category, Rate etc.
13. TradingExcise – Reference No., Duty Amount etc.
 |

| Purchase | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 - Voucher Type/Number/Series Code, Stock Updation Date, Sale Type Code, Form Received/Issued– Status /Code/ Amount, Excise – Applicable / Value/ Type, Broker Code etc.
2. Tran2 - Material Centre Code, Bill Sundry Master Code, Account Master Code, Cash Flow, Item Additional Info, Opening Balance amount etc.
3. Tran3 - Reference Code, Method, Due Date, Broker Number, Item Code etc.
4. Tran5 - Voucher code/ Type/ Series Code, Cost Centre Code, Serial Number, Short Narration etc.
5. VchOtherInfo – Optional Fields (1-10), Transport Details, Form 31 Number/ Issued Date, Purchase Bill Number/ Date etc.
6. TradingExcise – Reference Code/ Number, Method, Duty Rate/ Type/ Amount, balance, Manufacturer Details (Bill Number, Quantity, Code) etc.
7. OEDDet – Voucher Code, AED Amount
8. ItemDesc – Voucher Code, Item Description (1-4)
9. Help2 – Transport Details, Item Description etc.
10. Folio1
11. Excise – Voucher Number, BED/AED – Amount/ Balance etc.
12. BillingDet – Voucher Code, Party Name/ Address
13. STDet – Voucher Code, Service Tax Category, Rate etc
 |
| --- | --- | --- | --- | --- |
| Sale Return | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Type/Number/Series Code, Stock Updation Date, Sale Type Code, Form Received/Issued– Status /Code/ Amount, Excise – Applicable / Value/ Type, Broker Code etc.
2. Tran2 - Material Centre Code, Bill Sundry Master Code, Account Master Code, Cash Flow, Item Additional Info, Opening Balance amount etc.
3. Tran3 - Reference Code, Method, Due Date, Broker Number, Item Code etc.
4. Tran5 - Voucher code/ Type/ Series Code, Cost Centre Code, Serial Number, Short Narration etc.
5. VchOtherInfo - Voucher Code, Optional Fields (1-10), Transport Details, Form 31 umber etc.
6. OEDDet – Voucher Code, AED Amount
7. Help2 - Transport Details, Item Description etc.
8. Excise - – Voucher Number, BED/AED – Amount/ Balance etc.
9. BillingDet - Voucher Code, Party Name/ Address
10. STDet – Voucher Code, Service Tax Category, Rate etc.
11. ItemDesc – Voucher Code, Item Description
12. TradingExcise – Reference No., Duty Amount etc.
 |

| Purchase Return | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Type/Number/Series Code, Stock Updation Date, Sale Type Code, Form Received/Issued– Status /Code/ Amount, Excise – Applicable / Value/ Type, Broker Code etc.
2. Tran2 - Material Centre Code, Bill Sundry Master Code, Account Master Code, Cash Flow, Item Additional Info, Opening Balance amount etc.
3. Tran3 - Reference Code, Method, Due Date, Broker Number, Item Code etc.
4. Tran5 - Voucher code/ Type/ Series Code, Cost Centre Code, Serial Number, Short Narration etc.
5. VchOtherInfo - Voucher Code, Optional Fields (1-10), Transport Details, Form 31 umber etc.
6. OEDDet – Voucher Code, AED Amount
7. Help2 - Transport Details, Item Description etc.
8. Excise - Voucher Number, BED/AED – Amount/ Balance etc.
9. BillingDet - Voucher Code, Party Name/ Address
10. STDet – Voucher Code, Service Tax Category, Rate etc
11. ItemDesc – Voucher Code, Item Description
12. TradingExcise – Reference No., Duty Amount etc.
 |
| --- | --- | --- | --- | --- |
| Payment | frm Journal Vch | udtVchData | CVchDataAcc |
1. Tran1 – Voucher Code/Type/Series Code, Excise Applicable/Doc Name/ Value, Created By, Modified By etc.
2. Tran2 – Account Master/ Item Master Code, Material Centre code etc.
3. Tran3 – Reference – Code/ Due Date/ Status, Broker Code etc.
4. Tran5 – Voucher Code/Series Code, Cost Centre Code, Transaction Type, short Narration etc.
5. VchOtherInfo – Voucher Code, Optional Fields (1-10) etc.
6. Help2 – Optional field value/Type etc.
7. Excise – Amount, Balance etc.
8. STDet – Voucher Code, Service Tax Category, Rate etc
9. TDS – Reference Number, TDS Rate/Amount, Surcharge Rate/Amount, Challan Number, Quarter etc.
 |

| Receipt | frmJournalVch | udtVchData | CVchDataAcc |
1. Tran1 – Voucher Code/Type/Series Code, Excise Applicable/Doc Name/ Value, Created By, Modified By etc.
2. Tran2 – Account Master/ Item Master Code, Material Centre code etc.
3. Tran3 – Reference – Code/ Due Date/ Status, Broker Code etc.
4. Tran5 – Voucher Code/Series Code, Cost Centre Code, Transaction Type, short Narration etc.
5. VchOtherInfo – Voucher Code, Optional Fields (1-10) etc.
6. Help2 – Optional field value/Type etc.
7. Excise – Amount, Balance etc.
8. STDet – Voucher Code, Service Tax Category, Rate etc
9. TDS – Reference Number, TDS Rate/Amount, Surcharge Rate/Amount, Challan Number, Quarter etc.
 |
| --- | --- | --- | --- | --- |
| Journal | frmJournalVch | udtVchData | CVchDataAcc |
1. Tran1 – Voucher – Code/ Type/Series Code, Auto voucher Numbering, Created By, Modified By etc.
2. Tran2 – Account Master Code, tem Master Code, material Centre Code etc.
3. Tran3 – Reference Code, Due Date, Broker Code etc.
4. Tran5 – Cost Centre Code, Transaction Type, Short Narration etc.
5. VchOtherInfo – Optional fields (1-10) etc.
6. Help2 – Optional Field Number, Value etc.
7. STDet – Voucher Code, Service Tax Category, Rate etc
8. TDS – Reference Number, TDS Rate/Amount, Surcharge Rate/Amount, Challan Number, Quarter etc.
9. Excise – Vchcode, DocName, Date
 |
| Contra | frmJournalVch | udtVchData | CVchDataAcc |
1. Tran1 - Voucher – Code/ Type/Series Code, Auto voucher Numbering, Created By, Modified By etc.
2. Tran2 – Account Master Code, Date, cash Flow etc.
3. VchOtherInfo – Optional fields (1-10)
4. Help2 – Optional Field Number/ Value etc.
 |
| Debit Note | frmJournalVch | udtVchData | CVchDataAcc |
1. Tran1 – Voucher – Code/ Type/Series Code, Auto voucher Numbering, Created By, Modified By etc.
2. Tran2 – Account Master Code, tem Master Code, material Centre Code etc.
3. Tran3 – Reference Code, Due Date, Broker Code etc.
4. Tran5 – Cost Centre Code, Transaction Type, Short Narration etc.
5. VchOtherInfo – Optional fields (1-10) etc.
6. Help2 – Optional Field Number, Value etc.
7. STDet – Voucher Code, Service Tax Category, Rate etc
8. Excise – Vchcode, DocName, Date
 |

| Credit Note | frmJournalVch | udtVchData | CVchDataAcc |
1. Tran1 – Voucher – Code/ Type/Series Code, Auto voucher Numbering, Created By, Modified By etc.
2. Tran2 – Account Master Code, tem Master Code, material Centre Code etc.
3. Tran3 – Reference Code, Due Date, Broker Code etc.
4. Tran5 – Cost Centre Code, Transaction Type, Short Narration etc.
5. VchOtherInfo – Optional fields (1-10) etc.
6. Help2 – Optional Field Number, Value etc.
7. STDet – Voucher Code, Service Tax Category, Rate etc
8. Excise – Vchcode, DocName, Date
 |
| --- | --- | --- | --- | --- |
| Stock Transfer | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Code/Type, Material Centre (From/To) etc.
2. Tran2 – Item Code, Material centre (To/ From), Bill Sundry Master Code, Main/Alt Unit Code, Tax Paid, Exempted, Percent Value etc.
3. Tran3 – Reference Code, Method, Item Code, Material Centre (From/To), Batch Number, Due Date etc.
4. VchOtherInfo – Optional Fields, Transport Details, Narration etc.
5. ItemDesc – Serial Number, Item Description
6. Help2 – Transport Details etc.
 |
| Production | frmProduction | udtVchData | CVchDataInv |
1. Tran1 – Voucher Code/Type, Date, Stock Updation Date, BOM Name etc.
2. Tran2 – Item Code, Material Centre Code, Quantity in Main/Alt Unit, BOM Code etc.
3. Tran3 – Reference Code, Item Code, Material centre Code, Due date etc.
4. VchOtherInfo – Optional Fields
5. ItemDesc – Voucher Code, Item Description
6. Help2 – Optional field Number/value
 |
| Unassemble | frmProduction | udtVchData | CVchDataInv |
1. Tran1 – Voucher Code/Type, Date, Stock Updation Date, BOM Name etc.
2. Tran2 – Item Code, Material Centre Code, Quantity in Main/Alt Unit, BOM Code etc.
3. Tran3 – Reference Code, Item Code, Material centre Code, Due date etc.
4. VchOtherInfo – Optional Fields
5. ItemDesc – Voucher Code, Item Description
6. Help2 – Optional field Number/value
 |

| Stock Journal | frmProduction | udtVchData | CVchDataInv |
1. Tran1 – Voucher Code/Type, Material Centre Code, Auto Voucher Numbering etc.
2. Tran2 - Item Code, Material Centre Code, Quantity in Main/Alt Unit, BOM Code etc.
3. Tran3 – Reference Code, Item Code, Material centre Code, Due date, Batch Number etc
4. VchOtherInfo – Optional Fields
5. ItemDesc - Voucher Code, Item description
6. Help2 – Optional Field Number/Value etc.
 |
| --- | --- | --- | --- | --- |
| Mat. Rcvd. From Party | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Code/Type/Number, Party Code, Stock Updation date etc.
2. Tran2 – Voucher Code, Item code, Bill Sundry master Code, Quantity in Main/alt Unit etc.
3. Tran3 – Reference Code, Material Centre code, Item Code, Batch Number, Status, due Date etc.
4. VchOtherInfo – Optional fields, Transport Details
5. Help2 – Transport Detail
6. ItemDesc – Voucher Code, Item Description
 |
| Mat. Issued To Party | frmInvVch | udtVchData | CVchDataInv |
1. Tran1 – Voucher Code/Type/Number, Party Code, Stock Updation date etc.
2. Tran2 – Voucher Code, Item code, Bill Sundry master Code, Quantity in Main/alt Unit etc.
3. Tran3 – Reference Code, Material Centre code, Item Code, Batch Number, Status, due Date etc.
4. VchOtherInfo – Optional fields, Transport Details
5. Help2 – Transport Details
6. ItemDesc – Voucher Code, Item Description
 |
| Forms Received | frmFormsRecIss | udtFormHead | CvchDataForm |
1. Tran8 – Voucher Code/ Type, Form Code/Number, Party Code etc.
2. Tran9 – Form Code/Number, Bill Code, Amount etc.
 |
| Forms Issued | frmFormsRecIss | udtFormHead | CvchDataForm |
1. Tran8 – Voucher Code/Type, Form Received Date, Form Number etc.
2. Tran9 – Party Code, Form Code, Bill Code, amount etc.
 |
| VAT Journal | frmVATJournal | udtVATJV |
 |
1. VATInfo – Date, Amount etc.
 |
| Adjust Excise Amounts | frmExciseAdj | udtExciseInfo | CExciseInfo |
1. Excise – Voucher Code, Date, PLA Amount Adjusted etc.
 |

After going through the above document, you will have a broad idea of database structure of BUSY.

BIPL Database Structure of BUSY 20
