-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Jul 2025 pada 06.43
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kopi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `name`, `description`, `price`, `image`, `created_at`) VALUES
(1, 'Espresso', 'Kopi hitam pekat tanpa gula', 15000, 'espresso.jpg', '2025-07-12 17:27:32'),
(2, 'Cappuccino', 'Kopi dengan susu dan foam', 20000, 'cappuccino.jpg', '2025-07-12 17:27:32'),
(3, 'Americano', 'Espresso ditambah air panas', 18000, 'americano.jpg', '2025-07-12 17:27:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('pending','confirmed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `menu_id`, `quantity`, `note`, `status`, `created_at`) VALUES
(1, 2, 1, 1, 'pesen ges', 'pending', '2025-07-12 18:04:03'),
(2, 2, 1, 1, '', 'pending', '2025-07-12 18:09:56'),
(3, 7, 1, 1, 'uoi', 'pending', '2025-07-12 18:45:39'),
(4, 2, 1, 1, 'wi', 'pending', '2025-07-13 01:51:13'),
(5, 8, 1, 4, 'qwertyukl', 'pending', '2025-07-13 01:54:06'),
(6, 2, 1, 7, 'wertyuiookjhgfdfghjkl,jhgfcxhjkknbvc', 'pending', '2025-07-13 02:05:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(2, 'Abimanyu', 'abimanyu@gmail.com', '$2y$10$TJFm/s.kimoQ4exKPCktte0P3jA9kPWOXqmnjGFq62JSR7vFvqp/y', 'user', '2025-07-12 18:03:31'),
(5, 'Admin Cafe', 'admin@kopi.com', '$2y$10$y.YKeF5MTybMJxgUJcEv6OwRA9VYdpYuE9LZONN7uxYNTbP6xIqya', 'admin', '2025-07-12 18:08:34'),
(6, 'Admin Cafe', 'admin@gmail.com', '<?= password_hash(\"admin123\", PASSWORD_DEFAULT) ?>', 'admin', '2025-07-12 18:41:35'),
(7, 'tomblok', 'tomblok@gmail.com', '$2y$10$mMu3Oayzo08pSp8KZbu46uB4My/8DjDX7pul74WqqtCmOrcpLJ/J.', 'user', '2025-07-12 11:45:08'),
(8, 'cil', 'cil@gmail.com', '$2y$10$.43w4wfsIssS9wVwoCOUdOPjvVQ43733sWPqN8Jw/vK9Luxxylc1K', 'user', '2025-07-12 18:53:32'),
(9, 'paris', 'paris@gmail.com', '$2y$10$QZ/hh6ObiK0hTG69jyRCPe3WFQUs9S9BoZx43LqEZmemCbR9ms/8y', 'user', '2025-07-12 19:05:02');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
