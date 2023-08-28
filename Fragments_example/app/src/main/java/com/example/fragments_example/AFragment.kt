package com.example.fragments_example

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.example.fragments_example.databinding.AFragmentBinding


class AFragment: Fragment() {

    //Method from fragment
    //Right click -> generate -> override methos - onCreateView

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {

        //Get xml and put it into binding variable
        val binding: AFragmentBinding = AFragmentBinding.inflate(inflater, container, false)
        return binding.root
    }

    //Create it for good practices and error avoidance in order to create static methods
    //which is a method that belongs to a class rather than an instance of a class.
    companion object {
        fun newInstance(): AFragment {
            return AFragment()
        }
    }
}