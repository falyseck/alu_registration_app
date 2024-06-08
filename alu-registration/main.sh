#!/bin/bash

# File to store student records
FILE="students_list_1023.txt"

# Function to create a new student record
create_student_record() {
    echo "Enter student email:"
    read email
    echo "Enter student age:"
    read age
    echo "Enter student ID:"
    read id
    echo "$email,$age,$id" >> $FILE
    echo "Student record created successfully."
}

# Function to view all students
view_all_students() {
    if [ -f $FILE ]; then
        cat $FILE
    else
        echo "No student records found."
    fi
}

# Function to delete a student record
delete_student_record() {
    echo "Enter student ID to delete:"
    read id
    if [ -f $FILE ]; then
        grep -v ",$id\$" $FILE > temp.txt && mv temp.txt $FILE
        echo "Student record deleted successfully."
    else
        echo "No student records found."
    fi
}

# Function to update a student record
update_student_record() {
    echo "Enter student ID to update:"
    read id
    if [ -f $FILE ]; then
        grep -v ",$id\$" $FILE > temp.txt
        mv temp.txt $FILE
        echo "Enter new student email:"
        read email
        echo "Enter new student age:"
        read age
        echo "$email,$age,$id" >> $FILE
        echo "Student record updated successfully."
    else
        echo "No student records found."
    fi
}

# Main menu
while true; do
    echo "1. Create student record"
    echo "2. View all students"
    echo "3. Delete student record"
    echo "4. Update student record"
    echo "5. Exit"
    echo "Enter your choice: "
    read choice

    case $choice in
        1) create_student_record ;;
        2) view_all_students ;;
        3) delete_student_record ;;
        4) update_student_record ;;
        5) echo "Goodbye!" ; exit ;;
        *) echo "Invalid choice, please try again." ;;
    esac
done

