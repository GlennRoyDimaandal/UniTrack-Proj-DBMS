using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace Login_System
{
    public partial class Form2 : Form
    {
        MySqlConnection registerAccount = new MySqlConnection
        ("datasource=localhost;port=3306;username=root;password=root");
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(textBox1.Text) || string.IsNullOrEmpty(textBox2.Text)
                || string.IsNullOrEmpty(textBox3.Text) || string.IsNullOrEmpty(textBox4.Text)
                || string.IsNullOrEmpty(textBox5.Text))
            {
                MessageBox.Show("Please fill out all information!", "Error");
                return;
            }
            else
            {
                registerAccount.Open();

                MySqlCommand cmd1 = new MySqlCommand("SELECT * FROM loginportal.user_information WHERE Username = @UserName", registerAccount),
                cmd2 = new MySqlCommand("SELECT * FROM loginform.userinfo WHERE Email = @UserEmail", registerAccount);


                cmd1.Parameters.AddWithValue("@UserName", textBox1.Text);

                bool userExists = false;

                using (var dr1 = cmd1.ExecuteReader())
                    if (userExists = dr1.HasRows) MessageBox.Show("Username is already been used, please use different username");


                if (!(userExists ))
                {

                    string iquery = "INSERT INTO loginportal.user_information(`USER_ID`,`username`,`password`,`first_Name`,`last_Name`,`Address`) VALUES (NULL, '" + textBox1.Text + "', '" + textBox2.Text + "', '" + textBox3.Text + "', '" + textBox4.Text + "', '" + textBox5.Text + "')";
                    MySqlCommand commandDatabase = new MySqlCommand(iquery, registerAccount);
                    commandDatabase.CommandTimeout = 60;

                    try
                    {
                        // Reaching the datasets from the SQL Database
                        MySqlDataReader myReader = commandDatabase.ExecuteReader();
                    }
                    catch (Exception ex)
                    {
                        // Show any error message.
                        MessageBox.Show(ex.Message);
                    }

                    MessageBox.Show("Account Successfully Created!");

                }
                // Remove the inout values from the texboxes
                textBox1.Clear();
                textBox2.Clear();
                textBox3.Clear();
                textBox4.Clear();
                textBox5.Clear();
                //Terminate SQL Connecion
                //registerAccount.Close();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 loginPage = new Form1();
            loginPage.ShowDialog();
        }
    }
 }
