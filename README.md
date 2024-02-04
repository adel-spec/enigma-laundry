package main

import (
	"database/sql"
	"fmt"
	"log"
	"os"

	_ "github.com/lib/pq"
)

const (
	host     = "localhost"
	port     = 5432
	user     = "your_username"
	password = "your_password"
	dbname   = "your_database_name"
)

func main() {
	db, err := sql.Open("postgres", fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable", host, port, user, password, dbname))
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	for {
		fmt.Println("===== Enigma Laundry Console App =====")
		fmt.Println("1. Menu Pelanggan")
		fmt.Println("2. Menu Layanan")
		fmt.Println("3. Menu Transaksi")
		fmt.Println("4. Keluar")
		fmt.Print("Pilih menu (1/2/3/4): ")

		var choice string
		fmt.Scanln(&choice)

		switch choice {
		case "1":
			menuPelanggan(db)
		case "2":
			menuLayanan(db)
		case "3":
			menuTransaksi(db)
		case "4":
			fmt.Println("Terima kasih! Keluar dari aplikasi.")
			os.Exit(0)
		default:
			fmt.Println("Pilihan tidak valid. Silakan pilih menu yang valid.")
		}
	}
}

func menuPelanggan(db *sql.DB) {
	fmt.Println("===== Menu Pelanggan =====")
	fmt.Println("1. View Pelanggan")
	fmt.Println("2. Insert Pelanggan")
	fmt.Println("3. Update Pelanggan")
	fmt.Println("4. Delete Pelanggan")
	fmt.Println("5. Kembali ke Menu Utama")
	fmt.Print("Pilih menu (1/2/3/4/5): ")

	var choice string
	fmt.Scanln(&choice)

	switch choice {
	case "1":
		// Implementasi VIEW Pelanggan
		// Tambahkan validasi di sini
	case "2":
		// Implementasi INSERT Pelanggan
		// Tambahkan validasi di sini
	case "3":
		// Implementasi UPDATE Pelanggan
		// Tambahkan validasi di sini
	case "4":
		// Implementasi DELETE Pelanggan
		// Tambahkan validasi di sini
	case "5":
		return
	default:
		fmt.Println("Pilihan tidak valid. Silakan pilih menu yang valid.")
	}

	// Panggil fungsi rekursif untuk tetap berada di menu Pelanggan
	menuPelanggan(db)
}

func menuLayanan(db *sql.DB) {
	fmt.Println("===== Menu Layanan =====")
	fmt.Println("1. View Layanan")
	fmt.Println("2. Insert Layanan")
	fmt.Println("3. Kembali ke Menu Utama")
	fmt.Print("Pilih menu (1/2/3): ")

	var choice string
	fmt.Scanln(&choice)

	switch choice {
	case "1":
		// Implementasi VIEW Layanan
		// Tambahkan validasi di sini
	case "2":
		// Implementasi INSERT Layanan
		// Tambahkan validasi di sini
	case "3":
		return
	default:
		fmt.Println("Pilihan tidak valid. Silakan pilih menu yang valid.")
	}

	// Panggil fungsi rekursif untuk tetap berada di menu Layanan
	menuLayanan(db)
}

func menuTransaksi(db *sql.DB) {
	fmt.Println("===== Menu Transaksi =====")
	fmt.Println("1. View Transaksi")
	fmt.Println("2. Insert Transaksi")
	fmt.Println("3. Kembali ke Menu Utama")
	fmt.Print("Pilih menu (1/2/3): ")

	var choice string
	fmt.Scanln(&choice)

	switch choice {
	case "1":
		// Implementasi VIEW Transaksi
		// Tambahkan validasi di sini
	case "2":
		// Implementasi INSERT Transaksi
		// Tambahkan validasi di sini
	case "3":
		return
	default:
		fmt.Println("Pilihan tidak valid. Silakan pilih menu yang valid.")
	}

	// Panggil fungsi rekursif untuk tetap berada di menu Transaksi
	menuTransaksi(db)
}
