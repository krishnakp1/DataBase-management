# DataBase-management
Managing the database of employees


package com.krishnaprasad.sqlite;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

public class DatabaseHelper extends SQLiteOpenHelper{
    public static final String DATABASE_NAME="employee.db";
    public static final String TABLE_NAME="employee_table";
    public static final String COL_1="ID";
    public static final String COL_2="FIRSTNAME";
    public static final String COL_3="LASTNAME";
    public static final String COL_4="AGE";
    public static final String COL_5="PhoneNo";
    public static final String COL_6="Salary";
    public static final String COL_7="Address";

    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, 1);
        SQLiteDatabase db=this.getWritableDatabase();
    }


    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("create table"+TABLE_NAME+"(ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, SURNAME TEXT, MARKS INTEGER)");

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS "+TABLE_NAME);
        onCreate(db);
    }

    public boolean insertData(String FirstName, String LastName, String Age, String PhoneNo, String Salary, String Address){
        SQLiteDatabase db=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put(COL_2,FirstName);
        contentValues.put(COL_3,LastName);
        contentValues.put(COL_4,Age);
        contentValues.put(COL_5,PhoneNo);
        contentValues.put(COL_6,Salary);
        contentValues.put(COL_7,Address);

        Long result=db.insert(TABLE_NAME, null, contentValues);
                if(result==-1)
                    return false;
                else
                    return true;

    }

    public Cursor getAllData(){
        SQLiteDatabase db=this.getWritableDatabase();
        Cursor res=db.rawQuery("select * from"+TABLE_NAME, null);
    }

    public boolean updateData(String Id, String FirstName, String LastName, String Age, String PhoneNo, String Salary, String Address){
        SQLiteDatabase db=this.getWritableDatabase();
        ContentValues contentValues=new ContentValues();
        contentValues.put(COL_1,Id);
        contentValues.put(COL_2,FirstName);
        contentValues.put(COL_3,LastName);
        contentValues.put(COL_4,Age);
        contentValues.put(COL_5,PhoneNo);
        contentValues.put(COL_6,Salary);
        contentValues.put(COL_7,Address);
        db.update(TABLE_NAME,contentValues, "ID=?", new String[]{Id});
        return true;
    }

    public int deleteData(String id)
    {
        SQLiteDatabase db=this.getWritableDatabase();
        return db.delete(TABLE_NAME,"ID=?",new String[]{id});
    }
}
