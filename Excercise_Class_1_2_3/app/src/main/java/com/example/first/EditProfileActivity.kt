package com.example.first

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.example.first.databinding.ActivityEditProfileBinding
import com.example.first.databinding.ActivityProfileBinding

class EditProfileActivity : AppCompatActivity() {

    private lateinit var binding: ActivityEditProfileBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityEditProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)

        //When clicked on option one will make it visible and the other
        //invisible
        binding.optionOneIV.setOnClickListener{
            binding.optionOneDone.visibility = View.VISIBLE
            binding.optionTwoDone.visibility = View.GONE
        }

        binding.optionTwoIV.setOnClickListener{
            binding.optionTwoDone.visibility = View.VISIBLE
            binding.optionOneDone.visibility = View.GONE
        }


        binding.saveBtn.setOnClickListener{

            var profilePic:Int = R.drawable.ic_launcher_background

            if(binding.optionOneIV.visibility == View.VISIBLE){
                profilePic = R.drawable.pp1
            } else if(binding.optionTwoIV.visibility == View.VISIBLE){
                profilePic = R.drawable.pp2
            }

            var name = binding.editNamePT.text.toString()

            val intent = Intent()
            intent.putExtra("img", profilePic)
            intent.putExtra("name", name)

            //Sends result back to the previous activity
            setResult(RESULT_OK, intent)
            finish()
        }
    }
}