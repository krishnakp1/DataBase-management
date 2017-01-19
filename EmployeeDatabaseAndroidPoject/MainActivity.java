
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

        editTextId=(EditText)findViewById(R.id.editText_id);
        editFirstName=(EditText)findViewById(R.id.editText_firstname);
        editLastName=(EditText)findViewById(R.id.editText_lastname);
        editAge=(EditText)findViewById(R.id.editText_age);
        editPhoneNo=(EditText)findViewById(R.id.editText_phoneno);
        editSalary=(EditText)findViewById(R.id.editText_salary);
        editAddress=(EditText)findViewById(R.id.editText_address);

        btnAddData=(Button)findViewById(R.id.button_add);
        btnViewAll=(Button)findViewById(R.id.button_viewAll);
        btnviewUpdate=(Button)findViewById(R.id.button_update);
        btnDelete=(Button)findViewById(R.id.button_delete);

        addData();
        viewAll();
        updateData();
        deleteData();
    }

    public void addData(){
        btnAddData.setOnClickListener(
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        boolean isInserted=myDb.insertData(editFirstName.getText().toString(),
                                editLastName.getText().toString(),
                                editAge.getText().toString(),
                                editPhoneNo.getText().toString(),
                                editSalary.getText().toString(),
                                editAddress.getText().toString());
                        if (isInserted==true)
                            Toast.makeText(MainActivity.this, "Data inserted", Toast.LENGTH_LONG).show();
                        else
                            Toast.makeText(MainActivity.this, "Data not inserted", Toast.LENGTH_LONG).show();
                    }
                }
        );
    }

    public void viewAll(){
        btnViewAll.setOnClickListener(
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Cursor res=myDb.getAllData();
                        if (res.getCount()==0){
                            showMessage("Error", "Nothing Found");
                            return;
                        }
                        StringBuffer buffer=new StringBuffer();
                        while (res.moveToNext()){
                            buffer.append("Id :"+res.getString(0)+"\n");
                            buffer.append("FirstName :"+res.getString(0)+"\n");
                            buffer.append("LastName :"+res.getString(0)+"\n");
                            buffer.append("Age :"+res.getString(0)+"\n");
                            buffer.append("PhoneNo :"+res.getString(0)+"\n");
                            buffer.append("Salary :"+res.getString(0)+"\n");
                            buffer.append("Address :"+res.getString(0)+"\\n");
                        }
                        showMessage("Data",buffer.toString());
                    }
                }
        );
    }

    public void showMessage(String title, String message){
        AlertDialog.Builder builder=new AlertDialog.Builder(this);
        builder.setCancelable(true);
        builder.setTitle(title);
        builder.setMessage(message);
        builder.show();
    }

    public void updateData(){
        btnviewUpdate.setOnClickListener(
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        boolean isUpdate=myDb.updateData(editTextId.getText().toString(),
                                editFirstName.getText().toString(),
                                editLastName.getText().toString(),
                                editAge.getText().toString(),
                                editPhoneNo.getText().toString(),
                                editSalary.getText().toString(),
                                editAddress.getText().toString());
                        if (isUpdate==true)
                            Toast.makeText(MainActivity.this, "Data updated", Toast.LENGTH_LONG).show();
                        else
                            Toast.makeText(MainActivity.this, "Data not updated", Toast.LENGTH_SHORT).show();
                    }
                }
        );
    }

    public void deleteData(){
        btnDelete.setOnClickListener(
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Integer deletedRows=myDb.deleteData((editTextId.getText().toString()));
                        if (deletedRows!=0)
                            Toast.makeText(MainActivity.this, "Data deleted", Toast.LENGTH_SHORT).show();
                        else
                            Toast.makeText(MainActivity.this, "Data not deleted", Toast.LENGTH_SHORT).show();
                    }
                }
        );
    }
}
