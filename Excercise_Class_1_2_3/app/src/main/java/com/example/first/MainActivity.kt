package com.example.first

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.example.first.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    /*private lateinit var passwordET:EditText*/

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityMainBinding.inflate(layoutInflater)

        setContentView(binding.root)

        //FindViewByiD allow us to obtain the reference to all the graphic components
        //But in this excersice we will user "binding" ex: loginBtn = findViewById(R.id.loginBtn)


        binding.loginBtn.setOnClickListener{
            var email = binding.emailET.text.toString()
            var pass = binding.passwordET.text.toString()
            var text = "${email}:${pass}"

            Toast.makeText(this, text, Toast.LENGTH_LONG).show()

            //Go to another activity
            //Val(Immutable reference) vs Var (Mutable Reference)

            val intent:Intent = Intent(this,ProfileActivity::class.java)
            intent.putExtra("email", email)
            startActivity(intent)

        }
    }
}