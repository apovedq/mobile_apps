package com.example.menuapp

import android.view.View
import androidx.recyclerview.widget.RecyclerView.ViewHolder
import com.example.menuapp.databinding.ItemBinding

//ViewHolder allow us to send visual elements to Recycle View in order to render

//(root: View) Son gets the root from ViewHolder(Root) Father
class ItemView(root: View) : ViewHolder (root){

   private val binding = ItemBinding.bind(root)
    val itemName = binding.itemNameTV
    val itemPrice = binding.itemPriceTV

}