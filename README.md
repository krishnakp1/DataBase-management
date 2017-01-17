# DataBase-management
Managing the database of employees


package com.krishnaprasad.sqlite;

import android.database.Cursor;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    DatabaseHelper myDb;
    EditText editTextId,editFirstName, editLastName, editAge, editPhoneNo, editSalary, editAddress;
    Button btnAddData;
    Button btnViewAll;
    Button btnviewUpdate;
    Button btnDelete;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        myDb=new DatabaseHelper(this);

        editTextId=(EditText)findViewById(R.id.editText_Id);
        editFirstName=(EditText)findViewById(R.id.editText_FirstName);
        editLastName=(EditText)findViewById(R.id.editText_LastName);
        editAge=(EditText)findViewById(R.id.ediText_Age);
        editPhoneNo=(EditText)findViewById(R.id.ediText_PhoneNo);
        editSalary=(EditText)findViewById(R.id.ediText_Salary);
        editAddress=(EditText)findViewById(R.id.ediText_Address);

        btnAddData=(Button)findViewById(R.id.button_add);
        btnViewAll=(Button)findViewById(R.id.button_viewAll);
        btnviewUpdate=(Button)findViewById(R.id.button_Update);
        btnDelete=(Button)findViewById(R.id.button_delete);

        AddData();
        viewAll();
        updateData();
        DeleteData();

    }

    public void AddData()
    {
       btnAddData.setOnClickListener(
               new View.OnClickListener(){
                   public void onClick(View v){
                       boolean isInserted=myDb.insertData(editFirstName.getText().toString(),
                               editLastName.getText().toString(),
                               editAge.getText().toString(),
                               editPhoneNo.getText().toString(),
                               editSalary.getText().toString(),
                               editAddress.getText().toString());

                       if (isInserted==true)
                           Toast.makeText(MainActivity.this, "Data Inserted", Toast.LENGTH_LONG).show();
                       else
                           Toast.makeText(MainActivity.this, "Data not Inserted", Toast.LENGTH_LONG).show();
                   }

               }
       );
    }

    public void viewAll(){
        btnViewAll.setOnClickListener(
                new View.OnClickListener(){
                    public void onClick(View v){
                        Cursor res=myDb.getAllData();
                        if (res.getCount()==0)
                            showMessage("Error", "Nothing Found");
                        return;
                        StringBuffer buffer=new StringBuffer();
                        while(res.moveToNext()){
                            buffer.append("ID: "+res.getString(0)+"\n");
                            buffer.append("FirstName: "+res.getString(1)+"\n");
                            buffer.append("LastName: "+res.getString(2)+"\n");
                            buffer.append("Age: "+res.getString(3)+"\n");
                            buffer.append("PhoneNo: "+res.getString(4)+"\n");
                            buffer.append("Salary: "+res.getString(5)+"\n");
                            buffer.append("Address: "+res.getString(6)+"\n\n");
                        }
                        showMessage("Data", buffer.toString());
                    }
                }
        );
    }

    public void showMessage(String title, String Message){
        AlertDialog.Builder builder=new AlertDialog.Builder(this);
        builder.setCancelable(true);
        builder.setTitle(title);
        builder.setMessage(Message);
        builder.show();
    }

    public void updateData(){
        btnviewUpdate.setOnClickListener(
                new View.OnClickListener(){
                    public void onClick(View v){
                        boolean isUpdate=myDb.updateData(editTextId.getText().toString(),
                                editFirstName.getText().toString(),
                                editLastName.getText().toString(),
                                editAge.getText().toString(),
                                editPhoneNo.getText().toString(),
                                editSalary.getText().toString(),
                                editAddress.getText().toString());
                        if (isUpdate==true)
                            Toast.makeText(MainActivity.this,"Data updated", Toast.LENGTH_LONG).show();
                        else
                            Toast.makeText(MainActivity.this,"Data not updated",Toast.LENGTH_LONG).show();
                    }
                }
        );
    }

    public void DeleteData(){
        btnDelete.setOnClickListener(
                new View.OnClickListener(){
                    public void onClick(View v){
                        Integer deletedRows=myDb.deleteData(editTextId.getText().toString());
                        if (deletedRows>0)
                            Toast.makeText(MainActivity.this, "Data deleted", Toast.LENGTH_LONG).show();
                        else
                            Toast.makeText(MainActivity.this, "Data not deleted", Toast.LENGTH_LONG).show();
                    }
                }
        );
    }
}

