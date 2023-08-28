package com.example.menuapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import com.example.menuapp.databinding.ActivityMenuDisplayBinding


class MenuDisplayActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMenuDisplayBinding

    var nameItem: String? = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMenuDisplayBinding.inflate((layoutInflater))
        setContentView(binding.root)

        //Click listener on each of menu buttons

        binding.carneAsadaBtn.setOnClickListener{
          var buttonItem = binding.carneAsadaBtn.text.toString()

            nameItem = buttonItem

            var confimationToast = "Holaa"
            Toast.makeText(this, confimationToast, Toast.LENGTH_SHORT).show()

            Log.d("MenuDisplayActivity", "${nameItem} clicked")

        }

        binding.pescadoBtn.setOnClickListener{
            var buttonItem = binding.pescadoBtn.text.toString()
            nameItem = buttonItem

            Log.d("MenuDisplayActivity", "${nameItem} clicked")
        }

        binding.polloBtn.setOnClickListener{
            var buttonItem = binding.polloBtn.text.toString()
            nameItem = buttonItem

            Log.d("MenuDisplayActivity", "${nameItem} clicked")
        }

        binding.sendBackBtn.setOnClickListener{

            val intent = Intent()
            intent.putExtra("orderData", nameItem)
            Log.d("MenuDisplayActivity", "${nameItem} sent")
            setResult(RESULT_OK, intent)
            finish()
        }
    }
}