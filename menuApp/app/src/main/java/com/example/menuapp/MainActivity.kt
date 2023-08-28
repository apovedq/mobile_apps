package com.example.menuapp

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.activity.result.ActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.menuapp.databinding.ActivityMainBinding
import com.example.menuapp.model.Item

class MainActivity : AppCompatActivity() {


    private lateinit var binding: ActivityMainBinding
    lateinit var adapter: ItemAdapter

    override fun onCreate(savedInstanceState: Bundle?) {

        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(R.layout.activity_main)
        setContentView(binding.root)

        //Start itemAdapter class
        adapter = ItemAdapter()
        //Configuration to add items to Recycler
        binding.itemsList.layoutManager = LinearLayoutManager(this)
        //Scroll if itemlist exceeds component size
        binding.itemsList.setHasFixedSize(true)

        binding.itemsList.adapter = adapter


        //Create launcher
        val launcher = registerForActivityResult(ActivityResultContracts.StartActivityForResult(), ::onResult)

        binding.addItemBtn.setOnClickListener{
            val intent: Intent = Intent(this, MenuDisplayActivity::class.java)
            launcher.launch(intent)
        }

    }

    fun onResult(result: ActivityResult){

        if(result.resultCode == RESULT_OK){
            val orderData = result.data?.extras?.getString("orderData")

            orderData?.let {
                adapter.addItem(Item(it, 10500.0))
            }
        }
    }
}