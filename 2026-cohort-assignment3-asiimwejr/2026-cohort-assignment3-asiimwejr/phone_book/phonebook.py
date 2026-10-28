phone_book = {}

def add_contact(name, phone_number):
    if name in phone_book:
        print(f"{name} already exists!")
    else:
        phone_book[name] = phone_number
        print(f"Contact {name} added successfully!")

def search_contact(name):
    if name in phone_book:
        print(f"{name}: {phone_book[name]}")
    else:
        print("Contact does not exist.")
        
# Pre-populating a contact for testing
add_contact("junior", "07376474764")

def view_contacts():
    if not phone_book:
        print("Your phone book is empty.")
    else:
        for name in phone_book:
            print(f"{name}: {phone_book[name]}")

def delete_contact(name):
    if name in phone_book:
        del phone_book[name]
        print(f"You have deleted {name}.")
    else:
        print("Contact not removed because it does not exist.")
        
# MAIN MENU 
while True:
    print("\nWelcome to the phone_book system")
    print("CONTACT BOOK")
    print("1. Add a contact")
    print("2. View contacts")
    print("3. Search for a contact")
    print("4. Delete a contact")
    print("5. Exit")

    choice = input("Choose 1 to 5: ").strip()
    
    
    if choice == "1":
        name = input("Enter the person's name: ")
        if name in phone_book:
            print("Contact already exists!")
        else:
            phone_number = input("Enter their phone number: ")
            add_contact(name, phone_number)

    elif choice == "2":
        view_contacts()

    elif choice == "3":
        name = input("Enter the name: ")
        search_contact(name)

    elif choice == "4":
        name = input("Enter the name: ")
        delete_contact(name)
        
    elif choice == "5":
        print("You have exitted the phonebook.")
        break  # Exits the loop safely
    else:
        print("Please choose a number from 1 to 5.")
