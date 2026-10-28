<p align="middle">
<img width="300" height="245" src="Data/mak.png"> <img width="300" height="245" src="Data/brc.png">
</p>


# Msc/PhD. Python Bioinformatics Assignment3

# 1. Contact Book Application

## Description

Design a console-based contact management system that allows a user to store, retrieve, search, and delete contact information. The application should display a simple text menu and allow users to select operations by entering corresponding options.

#### Requirements

Your program should include the following features:

***Add Contact:***
- Allow the user to add a new contact by entering a name and a phone number.

- Each contact should be stored in a suitable data structure (e.g., a dictionary or list of dictionaries).

- Prevent duplicate entries for the same name.

***View Contacts:***
- Display all saved contacts in a clear and readable format (e.g., one contact per line showing name and phone number).

- If there are no contacts, display an appropriate message.

***Search Contact:***
- Allow the user to search for a contact by name.

- If the contact exists, display the corresponding phone number.

- If not found, inform the user that the contact does not exist.

***Delete Contact:***
- Allow the user to delete a contact by name.

- Confirm deletion if the contact exists.

- Display a message if the name is not found.

***Exit:***
- Provide an option to exit the application gracefully.

## Running the Contact Book

Run the console application from the repository root:

```text
python cli.py
```

The application source is in `contact_book/`. Contacts are saved to
`results/contacts_data.json`, which is created when the first contact is saved.

# 2. Blood Bank Management System
## Description

Design a GUI-based application using _`tkinter`_ for interface design and _`matplotlib`_ for data visualization. The program should enable users to add donor information, view existing donors, and display a graphical representation of the available blood groups.

#### Requirements

Your program should include the following main features:

***Add Donors***

- Allow users to input donor details such as name, age, blood group, and contact information.

Automatically update the blood group inventory when a new donor is added.

***View Donor List***

- Display all donor records in a clear, tabular format using suitable tkinter widgets (e.g., ttk.Treeview).

***Blood Group Availability Chart***

- Create an interactive bar chart using matplotlib to visualize the current inventory of blood groups.

- The chart should reflect real-time updates as new donors are added.

***Real-Time Updates***

- Ensure that every time a new donor is added, both the donor list and inventory chart are updated automatically.

#### Required Modules

To implement this project, you must use the following Python modules:

**tkinter** → _For building the graphical user interface._

**ttk** → _For advanced UI components such as tables and combo boxes._

**matplotlib** → _For visualizing blood group inventory data in chart form._



#### *Remember:*
```- We are testing for project organization
- Proper documentation of your script
- Accuracy of your script
- Proper use of functions
- Submission Date: 16th/October/2026 at 1100HRS
```

<p align="middle">
<img width="300" height="245" src="Data/mak.png"> <img width="300" height="245" src="Data/brc.png">
</p>
