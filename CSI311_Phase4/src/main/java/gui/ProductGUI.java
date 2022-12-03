/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package gui;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.DefaultListModel;

/**
 *
 * @author hwarn
 */
public class ProductGUI extends javax.swing.JFrame {

    /**
     * Creates new form ProductGUI
     */
    public ProductGUI() {
        initComponents();
        refresh();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        list_Product = new javax.swing.JList<>();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        textField_ProductID = new javax.swing.JTextField();
        textField_Price = new javax.swing.JTextField();
        textField_Name = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        list_Product.addListSelectionListener(new javax.swing.event.ListSelectionListener() {
            public void valueChanged(javax.swing.event.ListSelectionEvent evt) {
                productListSelected(evt);
            }
        });
        jScrollPane1.setViewportView(list_Product);

        jLabel1.setText("Product Id:");

        jLabel2.setText("Price: ");

        jLabel3.setText("Name:");

        jButton1.setText("Delete");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteButtonPressed(evt);
            }
        });

        jButton2.setText("Update");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                updateButtonPressed(evt);
            }
        });

        jButton3.setText("New");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                newButtonPressed(evt);
            }
        });

        jLabel4.setText("Product Table");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jButton3)
                        .addContainerGap())
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(jButton2)
                            .addComponent(jButton1))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 264, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel1)
                                    .addComponent(jLabel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                    .addComponent(jLabel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED))
                            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGap(0, 0, Short.MAX_VALUE)
                                .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 97, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(47, 47, 47)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(textField_Name, javax.swing.GroupLayout.DEFAULT_SIZE, 97, Short.MAX_VALUE)
                            .addComponent(textField_Price)
                            .addComponent(textField_ProductID))
                        .addGap(69, 69, Short.MAX_VALUE))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(25, 25, 25)
                .addComponent(jLabel4)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1)
                            .addComponent(textField_ProductID, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel2)
                            .addComponent(textField_Price, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                        .addGap(18, 18, 18)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel3)
                            .addComponent(textField_Name, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))))
                .addGap(18, 18, 18)
                .addComponent(jButton3)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton2)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jButton1)
                .addContainerGap(22, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void newButtonPressed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_newButtonPressed
        try{

           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamaproject", "root","");
           Statement insert = connection.createStatement();
           
           String queryInsert = "INSERT INTO product " + "VALUES("
                   + textField_ProductID.getText() + ","
                   + textField_Price.getText() + ",'"
                   + textField_Name.getText() + "')";
           

           

           insert.executeUpdate(queryInsert);
           
           connection.close();

           
        } catch (Exception exception) {
            exception.printStackTrace();
        } 
        
        refresh();
    }//GEN-LAST:event_newButtonPressed

    private void updateButtonPressed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_updateButtonPressed
         try {

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamaproject", "root","");

        Statement staUpdate = connection.createStatement();


        String queryUpdate = 
                "UPDATE product SET " + 
                "Price = " + textField_Price.getText() + "," +
                "prod_name = '" + textField_Name.getText() + "'"
                + " WHERE product_id = " + textField_ProductID.getText();

                        
        staUpdate.executeUpdate(queryUpdate);
       
        connection.close();

        } catch (Exception exception) { //catch any exceptions that may have occured

            exception.printStackTrace(); //print any errors

        }
    }//GEN-LAST:event_updateButtonPressed

    private void deleteButtonPressed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteButtonPressed
        try {

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamaproject", "root","");

        Statement staDelete = connection.createStatement();


        String queryDelete = 
                "DELETE FROM product WHERE product_id = " + textField_ProductID.getText();

                        
        staDelete.executeUpdate(queryDelete);
       
        connection.close();

        } catch (Exception exception) { //catch any exceptions that may have occured

            exception.printStackTrace(); //print any errors

        }
        refresh();
    }//GEN-LAST:event_deleteButtonPressed

    private void productListSelected(javax.swing.event.ListSelectionEvent evt) {//GEN-FIRST:event_productListSelected
        // TODO add your handling code here:
        int index = list_Product.getSelectedIndex();
        if(index < 0){return;}


        //get the cpk (store_id, product_id)

        String s = (String) list_Product.getSelectedValue();
        
        String[] parts = s.split(" ");
        
        String product_id = parts[2];
          
        

        System.out.println(product_id);

        //Call the update form funciton to update the screen
        updateform(product_id);
    }//GEN-LAST:event_productListSelected

      public void updateform(String product_id){

        try {

        //Establish mysql connection

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamaproject", "root","");

        //Initialize the query

        String query = 
                "select * from product where product_id = " + product_id;

        //create the statement

        Statement sta = connection.createStatement();

        //Set the results

        ResultSet rs = sta.executeQuery(query);

        //Because we are targeting a primary key, we simply set the values to the results taht are retrieved.

        rs.next();
        //Set the controls to the dtabase values
        //textField_User.setText(rs.getString("ID"));

        textField_ProductID.setText(rs.getString("product_id"));
        textField_Price.setText(rs.getString("price"));
        textField_Name.setText(rs.getString("prod_name"));


        //close the connection

        connection.close();

        } catch (Exception exception) { //catch any exceptions that may have occured

            exception.printStackTrace(); //print any errors

        }

    }
    
    public void refresh(){

        try {

            //Connect to the database

            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/teamaproject", "root","");

            //initialize the query

            String query = "select * from product order by product_id";

            //Create a new statement

            Statement sta = connection.createStatement();

            //Execute the Query and assign the results to the rs object

            ResultSet rs = sta.executeQuery(query);

            //instantiate a new DefaultListModel

            DefaultListModel listModel;

            listModel = new DefaultListModel();

            //Loop through the results and add the items to the lsit model

            while (rs.next()) {

                listModel.addElement(
                        "Product id: " + rs.getString("product_id"));
            }

            //Set the model of the userList to the list Model

            list_Product.setModel(listModel);

            //Close the connection

            connection.close();

            //Catch any errors

        } catch (Exception exception) {

            exception.printStackTrace();

        }
        
    }
  
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JList<String> list_Product;
    private javax.swing.JTextField textField_Name;
    private javax.swing.JTextField textField_Price;
    private javax.swing.JTextField textField_ProductID;
    // End of variables declaration//GEN-END:variables
}
