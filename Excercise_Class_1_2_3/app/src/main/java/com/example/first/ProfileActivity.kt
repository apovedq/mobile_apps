package com.example.first

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts.StartActivityForResult
import com.example.first.databinding.ActivityProfileBinding

class ProfileActivity : AppCompatActivity() {

    private lateinit var binding: ActivityProfileBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate((layoutInflater))
        setContentView(binding.root)

        //Launcher
        val launcher = registerForActivityResult(StartActivityForResult(), ::onResult)

        //Command to get the info from previous activity
        val email:String? = intent.extras?.getString("email")

        //Because the "email" field may by Empty or Null. To avoid this we
        //use the following method
       email?.let {
           binding.emailTV.text = it
       }

        //When you want an activity to return something then we use
        //launcher
        binding.changeNameBtn.setOnClickListener {
            val intent = Intent(this, EditProfileActivity::class.java)
            launcher.launch(intent)
        }
    }

    //Function to get the result from the blining process
    fun onResult(result:ActivityResult){
        if(result.resultCode == RESULT_OK){
           val img = result.data?.extras?.getInt("img")
            val name = result.data?.extras?.getString("name")

            img?.let { binding.profilePicture.setImageResource(it)}
            name?.let { binding.usernameTV.text= it }

        }
    }
}