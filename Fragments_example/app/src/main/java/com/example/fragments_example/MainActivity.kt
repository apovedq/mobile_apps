package com.example.fragments_example

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.fragment.app.Fragment
import com.example.fragments_example.databinding.ActivityMainBinding


class MainActivity : AppCompatActivity() {


    private val binding: ActivityMainBinding by lazy{
        ActivityMainBinding.inflate(layoutInflater)
    }
    private val showAFragment = AFragment.newInstance()
    private val showBFragment = BFragment.newInstance()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(binding.root)

        binding.aBtn.setOnClickListener{
            showFragment(showAFragment)
        }

        binding.bBtn.setOnClickListener{
            showFragment(showBFragment)
        }

    }

    //Function to import and show the fragments
    fun showFragment(fragment: Fragment){
        supportFragmentManager.beginTransaction().replace(R.id.fragmentCL, fragment).commit()
    }
}