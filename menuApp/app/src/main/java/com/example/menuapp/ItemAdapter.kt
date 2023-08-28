package com.example.menuapp

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView.Adapter
import com.example.menuapp.model.Item

class ItemAdapter: Adapter<ItemView>() {

    //Create an arrau of Item class on model
    val items = ArrayList<Item>(5)

    // Initialize class

    init{

        //Add "Item" Object into "items" ArrayList
        items.add( Item("Chuleta", 9000.0))
        items.add( Item("Cervza", 12500.0))

    }

    //Method to create the visual skeleton of each list's item
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemView {

        val inflater = LayoutInflater.from(parent.context)
        val view = inflater.inflate(R.layout.item, null, false)
        val itemview = ItemView(view)
        return itemview
    }

    //Load the data into the skeleton
    override fun onBindViewHolder(holder: ItemView, position: Int) {
       val data = items[position]
        holder.itemName.text = data.name

        //String insertion
        holder.itemPrice.text = "$ ${data.price}"
    }

    //method to return the number of items in my arraylist
    override fun getItemCount(): Int {
       return items.size
    }

    fun addItem(item: Item){
        items.add(item)
        notifyDataSetChanged()
    }


}