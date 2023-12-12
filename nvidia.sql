-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: nvidia
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL,
  `CategoryName` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `icon` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'GTX 16 Series','1'),(2,'RTX 20 Series','2'),(3,'RTX 30 Series','3'),(4,'RTX 4060Ti/4060','4'),(5,'RTX 4070Ti/4070','5');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Productid` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Description` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `Price` int DEFAULT NULL,
  `imageLink` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `SellerID` int DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `stoke` int DEFAULT NULL,
  PRIMARY KEY (`Productid`),
  KEY `FK_Prod_Cate_idx` (`CategoryID`),
  KEY `pro-user_idx` (`SellerID`) /*!80000 INVISIBLE */,
  CONSTRAINT `FK_Prod_Cate` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `pro-user` FOREIGN KEY (`SellerID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'GeForce GTX 1650','Thương hiệu: MSI,Graphics Processing Unit: GTX 1650 D6 VENTUS XS OC 4G, Bộ nhớ: 4GB DDR6, Xung nhịp nhân đồ họa: 1620 MHz,Xung nhịp bộ nhớ	: 12 Gbps, Memory Bus :128-bit, Chuẩn giao tiếp	:PCI Express x16 3.0, Output: DL-DVI-D x 1 DisplayPort x 1 (v1.4) HDMI™ 2.0b x 1',5390000,'1650.png',1,NULL,100,100),(2,'GeForce GTX 1660 Super','Sản phẩm: Card đồ họa - VGA, Engine đồ họa:NVIDIA® GTX 1660S™, Model:GTX 1660 Super (1-Click OC), Chuẩn Bus:PCI Express 4.0 x 16, Bộ nhớ:6 GB GDDR6, Bus bộ nhớ:192-bit, CUDA Cores:1408, Memory Speed:14 Gbps, Core Clock:Boost Clock (MHz) 1800 1-Click OC Clock (MHz) 1815 (by installing Xtreme Tuner Plus Software and using 1-Click OC)',5590000,'1660sup.png',1,NULL,100,100),(3,'GeForce RTX 2060 Super','Sản phẩm: Card đồ họa - VGA, Engine đồ họa:RTX 2060 SUPER DUAL,  Bộ nhớ:8GB GDDR6, Graphics Clock: 1470 MHz, Boost Clock: 1650 MHz, Memory Clock: 14 Gbps, Lõi CUDA: 2176, Giao diện bộ nhớ: 256 bit, DirectX: 12 Raytracing',7900000,'2060sup.png',2,NULL,100,100),(4,'RTX 3060 Ti OC Edition 8GB GDDR6X','Engine đồ họa: NVIDIA® GeForce RTX™ 3060 TI, Chuẩn Bus: PCI Express 4.0, OpenGL: OpenGL 4.6, Bộ nhớ: 8GB GDDR6X, Xung nhân: Chế độ OC - 1785 MHz (Xung tăng cường) Chế độ Chơi Game - 1755 MHz (Xung tăng cường), CUDA Core: 4864, Tốc độ bộ nhớ: 19 Gbps, Giao diện: 2 cổng HDMI 2.1 3 cổng Displayport 1.4a Hỗ trợ chuẩn HDCP (2.3), Phần mềm: ASUS GPU Tweak II & Trình điều khiển GeForce Game Ready & trình điều khiển Studio',9590000,'3060ti.png',3,NULL,100,100),(5,'RTX 3060-12G WHITE','Tên Hãng: ASUS, Model: DUAL RTX 3060-12G WHITE, Engine đồ họa: NVIDIA® GeForce RTX™3060, Chuẩn khe cắm: PCI Express 4.0, Bộ nhớ trong: 12GB, Kiểu bộ nhớ: GDDR6, Bus: 192-bit, Core Clock: OC Mode: 1807 MHz (Boost Clock) Default Mode: 1777 MHz (Boost Clock), Cuda Cores: 3584, Memory Speed: 15 Gbps, Cổng giao tiếp: Yes x 1 (Native HDMI 2.1) Yes x 3 (Native DisplayPort 1.4a) HDCP Support Yes (2.3) ',8390000,'3060.png',3,NULL,100,100),(6,'RTX 2060 6GB GDDR6 Dual EVO OC','Engine đồ họa: GeForce RTX 2060, Bộ nhớ: 6GB GDDR6, Giao diện bộ nhớ: 192 bit, Kết nối: DisplayPort, HDMI, PSU đề nghị: 500W, Đầu nguồn phụ: 1 x 8-pin',6590000,'2060.png',2,NULL,100,100),(7,'RTX 3050 VENTUS 2X XS 8GB OC','Thương hiệu: MSI, GPU: RTX 3050 VENTUS 2X XS 8GB OC, Cuda Cores: 2560, Chuẩn giao tiếp: PCI Express® Gen 4 x8, Core Clocks: Boost: 1807 MHz, Tốc độ bộ nhớ: 14 Gbps, Bộ nhớ: 8GB GDDR6, Bus bộ nhớ: 128-bit, Cổng giao tiếp: DisplayPort x 1 (v1.4a) HDMI™ x 1 (Supports 4K@120Hz as specified in HDMI™ 2.1)',7590000,'3050.png',3,NULL,100,100),(8,'RTX 3070 Ti VENTUS 3X 8G OC','MODEL NAME: GeForce RTX™ 3070 Ti VENTUS 3X 8G OC, GRAPHICS PROCESSING UNIT: NVIDIA® GeForce RTX™ 3070, INTERFACE: PCI Express® Gen 4, CORES: 6144 Units, CORE CLOCKS: Boost:1800 MHz, MEMORY SPEED: 19 Gbps, MEMORY: 8GB GDDR6X, MEMORY BUS: 256-bit, OUTPUT: DisplayPort x 3 (v1.4a) HDMI x 1 (Supports 4K@120Hz as specified in HDMI 2.1), OPENGL VERSION SUPPORT: 4.6',10590000,'3070ti.png',3,NULL,100,100),(9,'GTX 1660 Ti 6GB GDDR6 OC','Được cung cấp bởi GeForce® GTX 1660 Ti, Đượctích hợp với giao diện bộ nhớ 6 bit GDDR6 192 bit, Hệ thống làm mát WINDFORCE 2X với quạt quay thay thế Quạt cánh quạt, Fan 90mm độc đáo, Tấm bảo vệ phía sau, GPU Clock 1800 MHz (Reference card là 1770 MHz)',5790000,'1660ti.png',1,NULL,100,100),(10,'RTX 4060 GAMING X 8G MLG','Nhân đồ họa: NVIDIA® GeForce RTX™ 4060, Chuẩn giao tiếp: PCI Express® Gen 4 x16 (sử dụng x8), Xung nhịp: Extreme Performance: 2610MHz (MSI Center) Boost: 2595 MHz, Cuda Core: 3072 Units, Tốc độ Bộ nhớ: 17 Gbps, Bộ nhớ: 8GB GDDR6, Bus bộ nhớ: 128-bit, Cổng xuất hình: DisplayPort x 3 (v1.4a) HDMI™ x 1 (Hỗ trợ HDR 4K@120Hz và HDR 8K@60Hz và Tốc độ làm mới có thể thay đổi (VRR) như được chỉ định trong HDMI™ 2.1a), Hỗ trợ phiên bản DIRECTX: 12 Ultimate',12790000,'4060.png',4,NULL,100,100),(11,'RTX 4060Ti GAMING X SLIM WHITE 8G','Tên sản phẩm: VGA MSI Geforce RTX 4060Ti GAMING X SLIM WHITE 8G, Loại sản phẩm: Card màn hình, GPU: RTX 4060Ti, Nhân Cuda: 4352 Units, Core Clock: Extreme Performance: 2685 MHz (MSI Center) Boost: 2670 MHz, Tốc độ bộ nhớ: 18 Gbps, Bộ nhớ: 8GB GDDR6, Bus bộ nhớ: 128-bit, Cổng xuất màn hình: DisplayPort x 3 (v1.4a) HDMI™ x 1 (Supports 4K@120Hz HDR,8K@60Hz HDR, and Variable Refresh Rate as speciﬁed in HDMI™ 2.1a)',18790000,'4060ti.png',4,NULL,100,100),(12,'RTX 4070 OC Edition 12GB','Nhân đồ họa: NVIDIA® GeForce RTX 4070, Bus tiêu chuẩn: PCI Express 4.0, Xung nhịp: Chế độ OC: 2550 MHz Chế độ mặc định: 2520 MHz (Boost clock), Nhân CUDA: 5888, Tốc độ bộ nhớ: 21 Gbps, OpenGL: OpenGL®4.6, Bộ nhớ Video: 12 GB GDDR6X, Giao thức bộ nhớ: 192-bit, Giao thức: Có x 1 (Native HDMI 2.1) Có x 3 (Native DisplayPort 1.4a) Hỗ trợ HDCP (2.3)',15990000,'4070.png',4,NULL,100,100),(13,'RTX 4070 Ti 12GB','Nhân đồ họa: NVIDIA® GeForce RTX™ 4070 Ti, Bus tiêu chuẩn: PCI Express 4.0, Xung nhịp: Chế độ OC: 2640 MHz Chế độ mặc định: 2610 MHz (Boost clock), Nhân CUDA: 7680, Tốc độ bộ nhớ: 21 Gbps, OpenGL: OpenGL®4.6, Bộ nhớ Video: 12 GB GDDR6X, Giao thức bộ nhớ: 192-bit, Độ phân giải: Độ phân giải tối đa 7680 x 4320, Giao thức: Có x 2 (Native HDMI 2.1) Có x 3 (Native DisplayPort 1.4a) Hỗ trợ HDCP (2.3)',23690000,'4070ti.png',4,NULL,100,100);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userID` int NOT NULL,
  `username` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `isseller` int DEFAULT NULL,
  `isadmin` int DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-12  1:46:41
