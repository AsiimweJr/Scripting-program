
donor_list = []

# A simple dictionary to keep track of our blood group quantities
blood_inventory = {
    "A+": 0, "A-": 0, "B+": 0, "B-": 0,
    "AB+": 0, "AB-": 0, "O+": 0, "O-": 0
}

#  MAIN APPLICATION LOOP 
while True:
    # Print the Main Menu
    print("\n=== BLOOD BANK SYSTEM ===")
    print("1. Add Donor")
    print("2. View Donor List")
    print("3. View Blood Group Inventory Chart")
    print("4. Exit")
    
    choice = input("Choose an option (1-4): ").strip()
    
    #  ADD DONORS & UPDATE INVENTORY 
    if choice == "1":
        print("\n Add New Donor ")
        name = input("Enter donor's full name: ").strip()
        age = input("Enter age: ").strip()
        blood_group = input("Enter blood group (e.g., A+, O-, B+): ").strip().upper()
        contact = input("Enter contact information: ").strip()
        
        # Check if the blood group typed is a real one
        if blood_group not in blood_inventory:
            print("Error: Invalid blood group! Please use A+, A-, B+, B-, AB+, AB-, O+, or O-.")
        else:
            # Create a dictionary for the new donor
            new_donor = {
                "name": name,
                "age": age,
                "blood": blood_group,
                "contact": contact
            }
            # Save the donor to our list
            donor_list.append(new_donor)
            
            # AUTOMATIC UPDATE: Increase the blood inventory count by 1
            blood_inventory[blood_group] = blood_inventory[blood_group] + 1
            
            print(f"\nSuccess! {name} has been added, and inventory updated.")
            
    #  VIEW DONOR LIST TABLE 
    elif choice == "2":
        print("\nCurrent Donor List ")
        
        # If the list has nothing in it
        if len(donor_list) == 0:
            print("No donors registered yet.")
        else:
            # Print a neat header for our text columns
            print(f"{'ID':<5} {'Name':<20} {'Age':<6} {'Blood':<8} {'Contact':<15}")
            print("-" * 55)
            
            # Loop through the list and print each person's row
            # 'enumerate' helps us give each donor a number starting at 1
            for index, donor in enumerate(donor_list, start=1):
                print(f"{index:<5} {donor['name']:<20} {donor['age']:<6} {donor['blood']:<8} {donor['contact']:<15}")

    # TEXT-BASED AVAILABILITY CHART
    elif choice == "3":
        print("\n Blood Group Availability Chart")
        print("Standard inventory visualization:")
        print("-" * 40)
        
        # Loop through every blood type in our dictionary
        for blood_type, count in blood_inventory.items():
            # Create a bar using stars '*' based on the count number
            # If count is 3, stars will look like '***'
            stars = "*" * count
            print(f"{blood_type:<5} | {stars} ({count} bags)")
            
        print("-" * 40)

    # 4: EXIT 
    elif choice == "4":
        print("biopython practice")
        break 
        
    else:
        print("Invalid choice. Please type a number between 1 and 4.")
