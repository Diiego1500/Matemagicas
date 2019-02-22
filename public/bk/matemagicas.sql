-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-02-2019 a las 20:37:53
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `matemagicas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_article`
--

CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `section` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `created_at` date NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `likes` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blog_article`
--

INSERT INTO `blog_article` (`id`, `title`, `img`, `section`, `categoria_id`, `created_at`, `url`, `likes`) VALUES
(1, 'Galileo Galilei', 'Img/Blog/Galileo.png', 'Galileo', 2, '2019-01-22', 'Galileo-Galilei', '[\"25\",\"2\",\"13\",\"26\"]'),
(2, 'Stephen Howking', 'Howking.png', 'Stephen', 2, '2019-01-24', 'Stephen-Howking', '[\"13\",\"26\",\"2\",\"25\"]'),
(3, 'Agujeros Negros', 'AgujerosNegros.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porttitor sed neque id posuere. Suspendisse pharetra ante ut lorem pharetra auctor. Proin nec dui at dolor tempor aliquet id sed mi. Mauris finibus ante quam, in rutrum ligula cursus a. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis blandit pellentesque tellus, id accumsan mi lobortis quis. Vestibulum pellentesque sed quam id condimentum. Sed ullamcorper purus volutpat lorem viverra luctus. Proin et velit sodales, euismod quam sed, lacinia tellus. Vivamus rhoncus urna sem. Duis eu velit vel dolor cursus molestie ac quis augue. [espacio]\r\n\r\nProin ut rhoncus tellus, sit amet feugiat sem. Aenean pharetra ipsum vitae massa efficitur, mattis dignissim diam vestibulum. Quisque sit amet neque vel libero tristique vulputate vitae non odio. Integer et elementum elit. Proin magna justo, vulputate non pharetra sit amet, interdum eget tellus. Maecenas nulla velit, cursus non nisi vitae, gravida viverra ex. Nam sit amet consectetur augue, vitae pellentesque lectus. Integer lacinia neque ante, et ultrices purus ornare at. Phasellus augue tellus, malesuada at erat et, suscipit porta est. Nunc sed magna quis turpis pellentesque aliquam quis at purus. Vestibulum sed enim sagittis, sodales ipsum a, imperdiet massa. Vivamus imperdiet quam tellus, eu vehicula dui facilisis sit amet. Sed dui ante, venenatis eu iaculis vel, euismod nec nibh. Maecenas cursus id nulla sed porttitor. [espacio]\r\n\r\nMorbi ac lobortis nibh. Pellentesque dapibus at ex ac eleifend. Nullam porttitor lorem at ligula tempus, sed volutpat lorem aliquet. Duis in nisl at nulla porttitor volutpat vel in mi. Morbi dictum magna at felis pretium, non malesuada orci bibendum. Aliquam pulvinar felis a risus eleifend pellentesque. Vestibulum tincidunt odio quis augue suscipit scelerisque. Nam pulvinar ante vitae libero vehicula malesuada. Sed nibh elit, ornare non venenatis feugiat, sollicitudin non leo. Vestibulum aliquam, est nec luctus commodo, quam ipsum egestas sem, ac rutrum enim mi dignissim justo. Duis tristique, dolor ornare ultricies luctus, felis diam placerat sem, in ultricies augue lectus ut metus. Maecenas ultricies, ex nec consectetur semper, metus turpis cursus elit, eget iaculis urna quam ac velit. Vestibulum aliquet erat neque, non fermentum ex rutrum a. Curabitur nec tincidunt dolor. Aliquam sit amet magna ac libero aliquet cursus in blandit sapien. Vivamus scelerisque eget arcu nec tincidunt. [espacio]\r\n\r\nIn ornare nulla sem, sit amet iaculis felis vestibulum in. Nulla in interdum ipsum, sed iaculis risus. Donec at dignissim augue. Nam eget tellus eget magna dignissim consequat. Duis et egestas urna. Pellentesque a egestas lectus. Aenean id magna ac odio facilisis mattis. Pellentesque efficitur nisi in felis condimentum, nec venenatis quam ultrices. [espacio]\r\n\r\nVivamus fringilla nulla vehicula neque volutpat molestie porttitor eu magna. Nunc eu enim in purus rhoncus vehicula. Nullam eu interdum libero. Etiam volutpat neque vel est semper suscipit. Sed varius mi vitae rhoncus venenatis. Nam in ipsum in elit euismod ultricies ac vitae ex. Fusce ultricies interdum lacus, nec blandit elit porttitor quis. Morbi convallis mi sed ligula fermentum dictum nec id est. Curabitur in accumsan nibh. Ut quis enim nec leo accumsan consequat. Vestibulum tristique non nunc eget finibus. Cras hendrerit ultricies diam et vehicula. Aenean eu ornare eros, id egestas ex. [espacio]', 4, '2019-01-24', 'Agujeros-Negros', '[\"13\"]'),
(4, 'Codigo Binario', 'CodigoBinario.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porttitor sed neque id posuere. Suspendisse pharetra ante ut lorem pharetra auctor. Proin nec dui at dolor tempor aliquet id sed mi. Mauris finibus ante quam, in rutrum ligula cursus a. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis blandit pellentesque tellus, id accumsan mi lobortis quis. Vestibulum pellentesque sed quam id condimentum. Sed ullamcorper purus volutpat lorem viverra luctus. Proin et velit sodales, euismod quam sed, lacinia tellus. Vivamus rhoncus urna sem. Duis eu velit vel dolor cursus molestie ac quis augue. [espacio]\r\n\r\nProin ut rhoncus tellus, sit amet feugiat sem. Aenean pharetra ipsum vitae massa efficitur, mattis dignissim diam vestibulum. Quisque sit amet neque vel libero tristique vulputate vitae non odio. Integer et elementum elit. Proin magna justo, vulputate non pharetra sit amet, interdum eget tellus. Maecenas nulla velit, cursus non nisi vitae, gravida viverra ex. Nam sit amet consectetur augue, vitae pellentesque lectus. Integer lacinia neque ante, et ultrices purus ornare at. Phasellus augue tellus, malesuada at erat et, suscipit porta est. Nunc sed magna quis turpis pellentesque aliquam quis at purus. Vestibulum sed enim sagittis, sodales ipsum a, imperdiet massa. Vivamus imperdiet quam tellus, eu vehicula dui facilisis sit amet. Sed dui ante, venenatis eu iaculis vel, euismod nec nibh. Maecenas cursus id nulla sed porttitor. [espacio]\r\n\r\nMorbi ac lobortis nibh. Pellentesque dapibus at ex ac eleifend. Nullam porttitor lorem at ligula tempus, sed volutpat lorem aliquet. Duis in nisl at nulla porttitor volutpat vel in mi. Morbi dictum magna at felis pretium, non malesuada orci bibendum. Aliquam pulvinar felis a risus eleifend pellentesque. Vestibulum tincidunt odio quis augue suscipit scelerisque. Nam pulvinar ante vitae libero vehicula malesuada. Sed nibh elit, ornare non venenatis feugiat, sollicitudin non leo. Vestibulum aliquam, est nec luctus commodo, quam ipsum egestas sem, ac rutrum enim mi dignissim justo. Duis tristique, dolor ornare ultricies luctus, felis diam placerat sem, in ultricies augue lectus ut metus. Maecenas ultricies, ex nec consectetur semper, metus turpis cursus elit, eget iaculis urna quam ac velit. Vestibulum aliquet erat neque, non fermentum ex rutrum a. Curabitur nec tincidunt dolor. Aliquam sit amet magna ac libero aliquet cursus in blandit sapien. Vivamus scelerisque eget arcu nec tincidunt. [espacio]\r\n\r\nIn ornare nulla sem, sit amet iaculis felis vestibulum in. Nulla in interdum ipsum, sed iaculis risus. Donec at dignissim augue. Nam eget tellus eget magna dignissim consequat. Duis et egestas urna. Pellentesque a egestas lectus. Aenean id magna ac odio facilisis mattis. Pellentesque efficitur nisi in felis condimentum, nec venenatis quam ultrices. [espacio]\r\n\r\nVivamus fringilla nulla vehicula neque volutpat molestie porttitor eu magna. Nunc eu enim in purus rhoncus vehicula. Nullam eu interdum libero. Etiam volutpat neque vel est semper suscipit. Sed varius mi vitae rhoncus venenatis. Nam in ipsum in elit euismod ultricies ac vitae ex. Fusce ultricies interdum lacus, nec blandit elit porttitor quis. Morbi convallis mi sed ligula fermentum dictum nec id est. Curabitur in accumsan nibh. Ut quis enim nec leo accumsan consequat. Vestibulum tristique non nunc eget finibus. Cras hendrerit ultricies diam et vehicula. Aenean eu ornare eros, id egestas ex. [espacio]', 5, '2019-01-29', 'Codigo-Binario', '[\"26\",\"2\"]'),
(5, 'Programación', 'Programacion.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porttitor sed neque id posuere. Suspendisse pharetra ante ut lorem pharetra auctor. Proin nec dui at dolor tempor aliquet id sed mi. Mauris finibus ante quam, in rutrum ligula cursus a. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis blandit pellentesque tellus, id accumsan mi lobortis quis. Vestibulum pellentesque sed quam id condimentum. Sed ullamcorper purus volutpat lorem viverra luctus. Proin et velit sodales, euismod quam sed, lacinia tellus. Vivamus rhoncus urna sem. Duis eu velit vel dolor cursus molestie ac quis augue. [espacio]\r\n\r\nProin ut rhoncus tellus, sit amet feugiat sem. Aenean pharetra ipsum vitae massa efficitur, mattis dignissim diam vestibulum. Quisque sit amet neque vel libero tristique vulputate vitae non odio. Integer et elementum elit. Proin magna justo, vulputate non pharetra sit amet, interdum eget tellus. Maecenas nulla velit, cursus non nisi vitae, gravida viverra ex. Nam sit amet consectetur augue, vitae pellentesque lectus. Integer lacinia neque ante, et ultrices purus ornare at. Phasellus augue tellus, malesuada at erat et, suscipit porta est. Nunc sed magna quis turpis pellentesque aliquam quis at purus. Vestibulum sed enim sagittis, sodales ipsum a, imperdiet massa. Vivamus imperdiet quam tellus, eu vehicula dui facilisis sit amet. Sed dui ante, venenatis eu iaculis vel, euismod nec nibh. Maecenas cursus id nulla sed porttitor. [espacio]\r\n\r\nMorbi ac lobortis nibh. Pellentesque dapibus at ex ac eleifend. Nullam porttitor lorem at ligula tempus, sed volutpat lorem aliquet. Duis in nisl at nulla porttitor volutpat vel in mi. Morbi dictum magna at felis pretium, non malesuada orci bibendum. Aliquam pulvinar felis a risus eleifend pellentesque. Vestibulum tincidunt odio quis augue suscipit scelerisque. Nam pulvinar ante vitae libero vehicula malesuada. Sed nibh elit, ornare non venenatis feugiat, sollicitudin non leo. Vestibulum aliquam, est nec luctus commodo, quam ipsum egestas sem, ac rutrum enim mi dignissim justo. Duis tristique, dolor ornare ultricies luctus, felis diam placerat sem, in ultricies augue lectus ut metus. Maecenas ultricies, ex nec consectetur semper, metus turpis cursus elit, eget iaculis urna quam ac velit. Vestibulum aliquet erat neque, non fermentum ex rutrum a. Curabitur nec tincidunt dolor. Aliquam sit amet magna ac libero aliquet cursus in blandit sapien. Vivamus scelerisque eget arcu nec tincidunt. [espacio]\r\n\r\nIn ornare nulla sem, sit amet iaculis felis vestibulum in. Nulla in interdum ipsum, sed iaculis risus. Donec at dignissim augue. Nam eget tellus eget magna dignissim consequat. Duis et egestas urna. Pellentesque a egestas lectus. Aenean id magna ac odio facilisis mattis. Pellentesque efficitur nisi in felis condimentum, nec venenatis quam ultrices. [espacio]\r\n\r\nVivamus fringilla nulla vehicula neque volutpat molestie porttitor eu magna. Nunc eu enim in purus rhoncus vehicula. Nullam eu interdum libero. Etiam volutpat neque vel est semper suscipit. Sed varius mi vitae rhoncus venenatis. Nam in ipsum in elit euismod ultricies ac vitae ex. Fusce ultricies interdum lacus, nec blandit elit porttitor quis. Morbi convallis mi sed ligula fermentum dictum nec id est. Curabitur in accumsan nibh. Ut quis enim nec leo accumsan consequat. Vestibulum tristique non nunc eget finibus. Cras hendrerit ultricies diam et vehicula. Aenean eu ornare eros, id egestas ex. [espacio]', 5, '2019-01-07', 'Programacion', '[\"13\",\"2\"]'),
(6, 'Cómo funciona el telescopio', 'Img.png', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur porttitor sed neque id posuere. Suspendisse pharetra ante ut lorem pharetra auctor. Proin nec dui at dolor tempor aliquet id sed mi. Mauris finibus ante quam, in rutrum ligula cursus a. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis blandit pellentesque tellus, id accumsan mi lobortis quis. Vestibulum pellentesque sed quam id condimentum. Sed ullamcorper purus volutpat lorem viverra luctus. Proin et velit sodales, euismod quam sed, lacinia tellus. Vivamus rhoncus urna sem. Duis eu velit vel dolor cursus molestie ac quis augue. [espacio]\r\n\r\nProin ut rhoncus tellus, sit amet feugiat sem. Aenean pharetra ipsum vitae massa efficitur, mattis dignissim diam vestibulum. Quisque sit amet neque vel libero tristique vulputate vitae non odio. Integer et elementum elit. Proin magna justo, vulputate non pharetra sit amet, interdum eget tellus. Maecenas nulla velit, cursus non nisi vitae, gravida viverra ex. Nam sit amet consectetur augue, vitae pellentesque lectus. Integer lacinia neque ante, et ultrices purus ornare at. Phasellus augue tellus, malesuada at erat et, suscipit porta est. Nunc sed magna quis turpis pellentesque aliquam quis at purus. Vestibulum sed enim sagittis, sodales ipsum a, imperdiet massa. Vivamus imperdiet quam tellus, eu vehicula dui facilisis sit amet. Sed dui ante, venenatis eu iaculis vel, euismod nec nibh. Maecenas cursus id nulla sed porttitor. [espacio]\r\n\r\nMorbi ac lobortis nibh. Pellentesque dapibus at ex ac eleifend. Nullam porttitor lorem at ligula tempus, sed volutpat lorem aliquet. Duis in nisl at nulla porttitor volutpat vel in mi. Morbi dictum magna at felis pretium, non malesuada orci bibendum. Aliquam pulvinar felis a risus eleifend pellentesque. Vestibulum tincidunt odio quis augue suscipit scelerisque. Nam pulvinar ante vitae libero vehicula malesuada. Sed nibh elit, ornare non venenatis feugiat, sollicitudin non leo. Vestibulum aliquam, est nec luctus commodo, quam ipsum egestas sem, ac rutrum enim mi dignissim justo. Duis tristique, dolor ornare ultricies luctus, felis diam placerat sem, in ultricies augue lectus ut metus. Maecenas ultricies, ex nec consectetur semper, metus turpis cursus elit, eget iaculis urna quam ac velit. Vestibulum aliquet erat neque, non fermentum ex rutrum a. Curabitur nec tincidunt dolor. Aliquam sit amet magna ac libero aliquet cursus in blandit sapien. Vivamus scelerisque eget arcu nec tincidunt. [espacio]\r\n\r\nIn ornare nulla sem, sit amet iaculis felis vestibulum in. Nulla in interdum ipsum, sed iaculis risus. Donec at dignissim augue. Nam eget tellus eget magna dignissim consequat. Duis et egestas urna. Pellentesque a egestas lectus. Aenean id magna ac odio facilisis mattis. Pellentesque efficitur nisi in felis condimentum, nec venenatis quam ultrices. [espacio]\r\n\r\nVivamus fringilla nulla vehicula neque volutpat molestie porttitor eu magna. Nunc eu enim in purus rhoncus vehicula. Nullam eu interdum libero. Etiam volutpat neque vel est semper suscipit. Sed varius mi vitae rhoncus venenatis. Nam in ipsum in elit euismod ultricies ac vitae ex. Fusce ultricies interdum lacus, nec blandit elit porttitor quis. Morbi convallis mi sed ligula fermentum dictum nec id est. Curabitur in accumsan nibh. Ut quis enim nec leo accumsan consequat. Vestibulum tristique non nunc eget finibus. Cras hendrerit ultricies diam et vehicula. Aenean eu ornare eros, id egestas ex. [espacio]', 5, '2019-01-29', 'Como-funciona-el-telescopio', '[\"13\",\"2\"]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog_category`
--

CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `blog_category`
--

INSERT INTO `blog_category` (`id`, `name`) VALUES
(2, 'Biografia'),
(3, 'Curiosidades'),
(4, 'Universo'),
(5, 'Tecnología'),
(6, 'Matemágicas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunity_answer`
--

CREATE TABLE `comunity_answer` (
  `id` int(11) NOT NULL,
  `answer` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pregunta_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `correct` tinyint(1) NOT NULL,
  `creationdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comunity_answer`
--

INSERT INTO `comunity_answer` (`id`, `answer`, `img`, `pregunta_id`, `usuario_id`, `correct`, `creationdate`) VALUES
(9, 'Hola, esta es tu primera respuesta.', NULL, 11, 25, 1, '2019-02-11'),
(10, 'Hola tercera pregunta, toma tu respuesta.', NULL, 13, 2, 1, '2019-02-11'),
(11, 'hola, hay otra forma de solucionarlo, en realidad es muy simple, solo sumas aqui y sumas alla', NULL, 13, 2, 0, '2019-02-11'),
(12, 'Hola, la respuesta es muy simple!', NULL, 12, 25, 0, '2019-02-11'),
(13, 'Hola Dbastidas, he venido a ayudarte, tranquilo, todo estará bien\r\n\r\nVerás, para solucionar este problema solo debes utilizar la siquiente librería', NULL, 14, 2, 0, '2019-02-11'),
(14, 'Hola Dbastidas, he venido a ayudarte, tranquilo, todo estará bien\r\n\r\nVerás, para solucionar este problema solo debes utilizar la siquiente librería: \r\n\r\n<a href=\"https://www.google.com.co/\">Google</a>\r\n\r\nY listo, todo funcionará de perlas ^^\r\n\r\nSaludos, Diego.', NULL, 14, 2, 1, '2019-02-11'),
(15, 'Hola,ya pude solucionar, muchas gracias', NULL, 15, 2, 1, '2019-02-14'),
(16, 'test', NULL, 15, 2, 0, '2019-02-14'),
(17, 'test2', NULL, 15, 2, 0, '2019-02-14'),
(18, 'SDFSDFSDF', NULL, 16, 2, 1, '2019-02-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comunity_question`
--

CREATE TABLE `comunity_question` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question` varchar(10000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `solved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `comunity_question`
--

INSERT INTO `comunity_question` (`id`, `title`, `question`, `image`, `usuario_id`, `date`, `url`, `solved`) VALUES
(11, 'pregunta 1', 'Hola esta es mi primera pregunta.', NULL, 2, '2019-02-11', 'W2guhUGCtcTWN5bPrJyqv5l0I4VsFwXr', 1),
(12, 'pregunta 2', 'Hola, esta es la segunda pregunta.', NULL, 2, '2019-02-11', 'Y6JyLlldNam67qPfgof2YfVvZrLHKTVP', 0),
(13, 'hola, esta es mi tercera pregunta', 'Hola mundo, tercera pregunta', NULL, 25, '2019-02-11', 'DQKBJxJUoymUm8y9XTDkPENq2sbIgiGo', 1),
(14, 'Lorem Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur risus sem, aliquam sed lectus sit amet, iaculis ornare erat. Morbi ut eros tortor. Pellentesque vel augue facilisis purus vulputate rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nec scelerisque leo. Maecenas nisi nulla, efficitur et condimentum sed, lobortis ac augue. Vivamus non ligula feugiat, imperdiet neque at, molestie mauris. Vivamus varius ex lorem, vitae luctus tellus feugiat vel. Maecenas ultrices id sapien et iaculis. Phasellus pretium eget justo id accumsan \\n\r\n\r\nInteger nec vestibulum tortor. Maecenas vehicula lorem eleifend tortor fringilla auctor. In hac habitasse platea dictumst. Suspendisse blandit, neque in finibus malesuada, justo magna porttitor odio, nec convallis mauris urna at tellus. Nulla finibus sit amet sem a suscipit. Ut scelerisque nunc neque, quis venenatis neque porttitor non. Fusce arcu nisl, tempor vel nunc nec, tincidunt venenatis arcu. Vivamus ornare consequat enim vitae varius. Nunc dui leo, consectetur nec lacus nec, semper eleifend urna. Cras nec elit scelerisque orci pretium mollis.', NULL, 2, '2019-02-11', 'noBgxakYHgetpdyfq6mB889UTX6Xi0AL', 1),
(15, 'hola mundo', 'hola mundo\r\n\r\nsoy diego bastidas', NULL, 2, '2019-02-11', 'zZt5w763GcVidqbiirVW3pRXZCASI57x', 1),
(16, 'prueba', 'hola mundo esta es otra prueba', NULL, 2, '2019-02-14', 'XYq0tmba3Nuop5qdl4Lw4K06cOzPpCEs', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `globals_tips`
--

CREATE TABLE `globals_tips` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `globals_tips`
--

INSERT INTO `globals_tips` (`id`, `title`, `description`) VALUES
(1, 'Tip del día', 'Procura ver el video introductorio de cada tema antes de resolver los ejercicios'),
(2, 'Tip del día', 'Arrastra los componentes del tablero a la sección de respuestas para tomar esta información y calificar tu respuesta'),
(3, 'Tip', 'Antes de empezar a resolver un ejercicio, ten en cuenta todos los temas que has visto antes. Las matemáticas son acumulativas y muchas veces se necesitan de temas que has visto previamente para resolver el actual.'),
(4, 'Tip', 'En muchas ocaciones, es muy util imaginarse el problema y / o ilustrarlo de alguna manera para ver graficamente el problema al que te enfrentas.'),
(5, 'Tip', 'Cuando el ejercicio sea muy complejo, se habilitará de manera automática un botón para ver su respuesta. Sin embargo, queremos que lo intentes, así que este botón será clickeable despues de 15 minutos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `practical_exercise`
--

CREATE TABLE `practical_exercise` (
  `id` int(11) NOT NULL,
  `theme_id` int(11) DEFAULT NULL,
  `level` double NOT NULL,
  `problem_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer` decimal(10,0) NOT NULL,
  `answer_string` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next_exercise` int(11) NOT NULL,
  `board_type` int(11) NOT NULL DEFAULT '0',
  `seeanswer` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `practical_exercise`
--

INSERT INTO `practical_exercise` (`id`, `theme_id`, `level`, `problem_path`, `answer`, `answer_string`, `next_exercise`, `board_type`, `seeanswer`) VALUES
(1, 1, 1, '', '0', '0', 0, 0, 0),
(2, 1, 1, '', '0', '0', 0, 0, 0),
(3, 4, 2, 'primary/sum/sum1.svg', '33', '33', 29, 0, 0),
(4, 4, 1, 'primary/sum/sum2.svg', '3', '3', 6, 0, 0),
(5, 4, 2, 'primary/sum/sum3.svg', '48', '48', 1000, 0, 0),
(6, 4, 1, 'primary/sum/sum4.svg', '9', '9', 1000, 0, 0),
(7, 4, 2, 'primary/sum/sum5.svg', '90', '57', 8, 0, 0),
(8, 4, 2, 'primary/sum/sum6.svg', '62', '62', 3, 0, 0),
(9, 4, 3, 'primary/sum/sum7.svg', '567', '567', 10, 0, 0),
(10, 4, 3, 'primary/sum/sum8.svg', '5677', '5677', 67, 0, 0),
(11, 4, 1, 'primary/sum/sum9.svg', '7', '7', 4, 0, 0),
(12, 4, 1, 'primary/sum/sum10.svg', '10', '10', 11, 0, 0),
(13, 4, 1, 'primary/sum/sum11.svg', '7', '7', 12, 0, 0),
(14, 4, 1, 'primary/sum/sum12.svg', '8', '8', 13, 0, 0),
(15, 4, 1, 'primary/sum/sum13.svg', '6', '6', 14, 0, 0),
(16, 4, 1, 'primary/sum/sum14.svg', '4', '4', 15, 0, 0),
(17, 4, 1, 'primary/sum/sum15.svg', '10', '10', 18, 0, 0),
(18, 4, 1, 'primary/sum/sum16.svg', '10', '10', 19, 0, 0),
(19, 4, 1, 'primary/sum/sum17.png', '9', '9', 20, 0, 1),
(20, 4, 1, 'primary/sum/sum18.svg', '8', '8', 21, 0, 0),
(21, 4, 1, 'primary/sum/sum19.svg', '3', '3', 22, 0, 0),
(22, 4, 1, 'primary/sum/sum20.svg', '9', '9', 23, 0, 0),
(23, 4, 1, 'primary/sum/sum21.svg', '6', '6', 24, 0, 0),
(24, 4, 1, 'primary/sum/sum22.svg', '0', '0', 25, 0, 0),
(25, 4, 1, 'primary/sum/sum23.svg', '10', '10', 26, 0, 0),
(26, 4, 1, 'primary/sum/sum24.png', '2', '2', 27, 0, 0),
(27, 4, 1, 'primary/sum/sum25.png', '4', '4', 16, 0, 0),
(28, 4, 1, 'primary/sum/sum26.png', '3', '3', 17, 0, 0),
(29, 4, 2, 'primary/sum/sum27.png', '4917', '4917', 30, 0, 0),
(30, 4, 2, 'primary/sum/sum27.png', '4917', '4917', 31, 0, 0),
(31, 4, 2, 'primary/sum/sum29.png', '9856', '9856', 32, 0, 0),
(32, 4, 2, 'primary/sum/sum30.png\r\n', '8894', '8894', 33, 0, 0),
(33, 4, 2, 'primary/sum/sum31.png\r\n', '9978', '9978', 34, 0, 0),
(34, 4, 2, 'primary/sum/sum32.png\r\n', '9292', '9292', 35, 0, 0),
(35, 4, 2, 'primary/sum/sum33.png\r\n', '9944', '9944', 36, 0, 0),
(36, 4, 2, 'primary/sum/sum34.png\r\n', '7379', '7379', 5, 0, 0),
(37, 4, 2, 'primary/sum/sum35.png\r\n', '4279', '4279', 7, 0, 0),
(38, 4, 2, 'primary/sum/sum36.png\r\n', '7994', '7994', 37, 0, 0),
(39, 4, 2, 'primary/sum/sum37.png\r\n', '6842', '6842', 45, 0, 0),
(40, 4, 2, 'primary/sum/sum38.png\r\n', '2249', '2249', 39, 0, 0),
(41, 4, 2, 'primary/sum/sum39.png', '8588', '8588', 40, 0, 0),
(42, 4, 2, 'primary/sum/sum40.png', '4174', '4174', 44, 0, 0),
(43, 4, 2, 'primary/sum/sum41.png', '3593', '3593', 42, 0, 0),
(44, 4, 2, 'primary/sum/sum42.png', '9768', '9768', 41, 0, 0),
(45, 4, 2, 'primary/sum/sum43.png', '8689', '8689', 46, 0, 0),
(46, 4, 2, 'primary/sum/sum44.png', '2571', '2571', 47, 0, 0),
(47, 4, 2, 'primary/sum/sum45.png', '4174', '4174', 48, 0, 0),
(48, 4, 2, 'primary/sum/sum46.png', '9889', '9889', 52, 0, 0),
(49, 4, 2, 'primary/sum/sum47.png', '7571', '7571', 38, 0, 0),
(50, 4, 2, 'primary/sum/sum48.png', '3593', '3593', 49, 0, 0),
(51, 4, 2, 'primary/sum/sum49.png', '9595', '9595', 50, 0, 0),
(52, 4, 2, 'primary/sum/sum50.png', '4658', '4658', 51, 0, 0),
(53, 4, 3, 'primary/sum/sum51.png', '9720', '9720', 9, 0, 0),
(54, 4, 3, 'primary/sum/sum52.png', '7433', '7433', 53, 0, 0),
(55, 4, 3, 'primary/sum/sum53.png', '9098', '9098', 54, 0, 0),
(56, 4, 3, 'primary/sum/sum54.png', '9222', '9222', 55, 0, 0),
(57, 4, 3, 'primary/sum/sum55.png', '11061', '11061', 56, 0, 0),
(58, 4, 3, 'primary/sum/sum56.png', '8773', '8773', 57, 0, 0),
(59, 4, 3, 'primary/sum/sum57.png', '20', '20', 58, 0, 0),
(60, 4, 3, 'primary/sum/sum58.png', '12106', '12106', 61, 0, 0),
(61, 4, 3, 'primary/sum/sum59.png', '14768', '14768', 62, 0, 0),
(62, 4, 3, 'primary/sum/sum60.png', '730', '730', 63, 0, 0),
(63, 4, 3, 'primary/sum/sum61.png', '18128', '18128', 64, 0, 0),
(64, 4, 3, 'primary/sum/sum62.png', '4973', '4973', 65, 0, 0),
(65, 4, 3, 'primary/sum/sum63.png', '9015', '9015', 66, 0, 0),
(66, 4, 3, 'primary/sum/sum64.png', '10431', '10431', 59, 0, 0),
(67, 4, 3, 'primary/sum/sum65.png', '9', '9', 1000, 0, 0),
(68, 5, 1, 'primary/res/res1.png\r\n', '6', '6', 82, 0, 0),
(69, 5, 1, 'primary/res/res1.png\r\n', '6', '6', 70, 0, 0),
(70, 5, 1, 'primary/res/res3.png\r\n', '5', '5', 71, 0, 0),
(71, 5, 1, 'primary/res/res4.png\r\n', '4', '4', 72, 0, 0),
(72, 5, 1, 'primary/res/res5.png\r\n', '0', '0', 73, 0, 0),
(73, 5, 1, 'primary/res/res6.png\r\n', '2', '2', 74, 0, 0),
(74, 5, 1, 'primary/res/res7.png\r\n', '2', '2', 75, 0, 0),
(75, 5, 1, 'primary/res/res8.png\r\n', '4', '4', 76, 0, 0),
(76, 5, 1, 'primary/res/res9.png\r\n', '0', '0', 77, 0, 0),
(77, 5, 1, 'primary/res/res10.png\r\n', '2', '2', 78, 0, 0),
(78, 5, 1, 'primary/res/res11.png\r\n', '2', '2', 92, 0, 0),
(79, 5, 1, 'primary/res/res12.png\r\n', '4', '4', 69, 0, 0),
(80, 5, 1, 'primary/res/res13.png\r\n', '5', '5', 79, 0, 0),
(81, 5, 1, 'primary/res/res14.png\r\n', '1', '1', 80, 0, 0),
(82, 5, 1, 'primary/res/res15.png', '4', '4', 83, 0, 0),
(83, 5, 1, 'primary/res/res16.png\r\n', '5', '5', 84, 0, 0),
(84, 5, 1, 'primary/res/res17.png\r\n', '5', '5', 85, 0, 0),
(85, 5, 1, 'primary/res/res18.png\r\n', '12', '12', 86, 0, 0),
(86, 5, 1, 'primary/res/res19.png\r\n', '17', '17', 87, 0, 0),
(87, 5, 1, 'primary/res/res20.png', '2', '2', 88, 0, 0),
(88, 5, 1, 'primary/res/res21.png\r\n', '8', '8', 89, 0, 0),
(89, 5, 1, 'primary/res/res22.png\r\n', '2', '2', 90, 0, 0),
(90, 5, 1, 'primary/res/res23.png\r\n', '70', '70', 91, 0, 0),
(91, 5, 1, 'primary/res/res24.png\r\n', '53', '53', 81, 0, 0),
(92, 5, 1, 'primary/res/res25.png\r\n', '5', '5', 1000, 0, 0),
(93, 5, 2, 'primary/res/res26.png', '853', '853', 94, 0, 0),
(94, 5, 2, 'primary/res/res27.png\r\n', '330', '330', 95, 0, 0),
(95, 5, 2, 'primary/res/res28.png\r\n', '654', '654', 96, 0, 0),
(96, 5, 2, 'primary/res/res29.png\r\n', '203', '203', 97, 0, 0),
(97, 5, 2, 'primary/res/res30.png\r\n', '513', '513', 98, 0, 0),
(98, 5, 2, 'primary/res/res31.png\r\n', '160', '160', 99, 0, 0),
(99, 5, 2, 'primary/res/res32.png\r\n', '103', '103', 100, 0, 0),
(100, 5, 2, 'primary/res/res33.png\r\n', '100', '100', 101, 0, 0),
(101, 5, 2, 'primary/res/res34.png\r\n', '132', '132', 114, 0, 0),
(102, 5, 2, 'primary/res/res35.png\r\n', '903', '903', 93, 0, 0),
(103, 5, 2, 'primary/res/res36.png\r\n', '10465', '10465', 102, 0, 0),
(104, 5, 2, 'primary/res/res37.png\r\n', '40412', '40412', 103, 0, 0),
(105, 5, 2, 'primary/res/res38.png\r\n', '13020', '13020', 106, 0, 0),
(106, 5, 2, 'primary/res/res39.png\r\n', '10205', '10205', 107, 0, 0),
(107, 5, 2, 'primary/res/res40.png\r\n', '7521', '7521', 108, 0, 0),
(108, 5, 2, 'primary/res/res41.png\r\n', '20503', '20503', 109, 0, 0),
(109, 5, 2, 'primary/res/res42.png\r\n', '32477', '32477', 110, 0, 0),
(110, 5, 2, 'primary/res/res43.png', '602', '602', 111, 0, 0),
(111, 5, 2, 'primary/res/res44.png\r\n', '134', '134', 112, 0, 0),
(112, 5, 2, 'primary/res/res45.png\r\n', '305', '305', 113, 0, 0),
(113, 5, 2, 'primary/res/res46.png\r\n', '151', '151', 104, 0, 0),
(114, 5, 2, 'primary/res/res47.png\r\n', '410', '410', 1000, 0, 0),
(115, 5, 3, 'primary/res/res48.png', '304', '304', 116, 0, 0),
(116, 5, 3, 'primary/res/res49.png', '366', '366', 117, 0, 0),
(117, 5, 3, 'primary/res/res50.png', '501', '501', 118, 0, 0),
(118, 5, 3, 'primary/res/res51.png', '644', '644', 119, 0, 0),
(119, 5, 3, 'primary/res/res52.png', '351', '351', 120, 0, 0),
(120, 5, 3, 'primary/res/res53.png', '377', '377', 121, 0, 0),
(121, 5, 3, 'primary/res/res54.png', '430', '430', 122, 0, 0),
(122, 5, 3, 'primary/res/res55.png', '152', '152', 134, 0, 0),
(123, 5, 3, 'primary/res/res56.png', '72', '72', 115, 0, 0),
(124, 5, 3, 'primary/res/res57.png', '307', '307', 123, 0, 0),
(125, 5, 3, 'primary/res/res58.png', '332', '332', 124, 0, 0),
(126, 5, 3, 'primary/res/res59.png', '91240', '91240', 127, 0, 0),
(127, 5, 3, 'primary/res/res60.png', '163', '163', 128, 0, 0),
(128, 5, 3, 'primary/res/res61.png', '365', '365', 129, 0, 0),
(129, 5, 3, 'primary/res/res62.png', '26', '26', 130, 0, 0),
(130, 5, 3, 'primary/res/res63.png', '11719', '11719', 131, 0, 0),
(131, 5, 3, 'primary/res/res64.png', '39487', '39487', 132, 0, 0),
(132, 5, 3, 'primary/res/res65.png', '3306', '3306', 133, 0, 0),
(133, 5, 3, 'primary/res/res66.png', '408', '408', 125, 0, 0),
(134, 5, 3, 'primary/res/res67.png', '781', '781', 1000, 0, 0),
(135, 6, 1, 'primary/mul/mul1.png\r\n', '5', '5', 146, 0, 0),
(136, 6, 1, 'primary/mul/mul2.png\r\n', '6', '6', 137, 0, 0),
(137, 6, 1, 'primary/mul/mul3.png\r\n', '54', '54', 138, 0, 0),
(138, 6, 1, 'primary/mul/mul4.png\r\n', '49', '49', 139, 0, 0),
(139, 6, 1, 'primary/mul/mul5.png\r\n', '30', '30', 140, 0, 0),
(140, 6, 1, 'primary/mul/mul6.png\r\n', '0', '0', 141, 0, 0),
(141, 6, 1, 'primary/mul/mul7.png\r\n', '54', '54', 142, 0, 0),
(142, 6, 1, 'primary/mul/mul8.png\r\n', '64', '64', 143, 0, 0),
(143, 6, 1, 'primary/mul/mul9.png\r\n', '352', '352', 154, 0, 0),
(144, 6, 1, 'primary/mul/mul10.png\r\n', '63', '63', 136, 0, 0),
(145, 6, 1, 'primary/mul/mul11.png\r\n', '36', '36', 144, 0, 0),
(146, 6, 1, 'primary/mul/mul12.png\r\n', '7', '7', 147, 0, 0),
(147, 6, 1, 'primary/mul/mul13.png\r\n', '25', '25', 148, 0, 0),
(148, 6, 1, 'primary/mul/mul14.png\r\n', '9', '9', 149, 0, 0),
(149, 6, 1, 'primary/mul/mul15.png\r\n', '28', '28', 150, 0, 0),
(150, 6, 1, 'primary/mul/mul16.png\r\n', '90', '90', 151, 0, 0),
(151, 6, 1, 'primary/mul/mul17.png\r\n', '20', '20', 152, 0, 0),
(152, 6, 1, 'primary/mul/mul18.png\r\n', '15', '15', 153, 0, 0),
(153, 6, 1, 'primary/mul/mul19.png\r\n', '196', '196', 145, 0, 0),
(154, 6, 1, 'primary/mul/mul20.png\r\n', '0', '0', 1000, 0, 0),
(155, 6, 2, 'primary/mul/mul21.png', '357', '357', 156, 0, 0),
(156, 6, 2, 'primary/mul/mul22.png', '520', '520', 157, 0, 0),
(157, 6, 2, 'primary/mul/mul23.png', '261', '261', 158, 0, 0),
(158, 6, 2, 'primary/mul/mul24.png', '243', '243', 159, 0, 0),
(159, 6, 2, 'primary/mul/mul25.png', '135', '135', 160, 0, 0),
(160, 6, 2, 'primary/mul/mul26.png', '208', '208', 161, 0, 0),
(161, 6, 2, 'primary/mul/mul27.png', '464', '464', 162, 0, 0),
(162, 6, 2, 'primary/mul/mul28.png', '525', '525', 174, 0, 0),
(163, 6, 2, 'primary/mul/mul29.png', '0', '0', 155, 0, 0),
(164, 6, 2, 'primary/mul/mul30.png', '656', '656', 163, 0, 0),
(165, 6, 2, 'primary/mul/mul31.png', '567', '567', 164, 0, 0),
(166, 6, 2, 'primary/mul/mul32.png', '3744', '3744', 167, 0, 0),
(167, 6, 2, 'primary/mul/mul33.png', '150', '150', 168, 0, 0),
(168, 6, 2, 'primary/mul/mul34.png', '90', '90', 169, 0, 0),
(169, 6, 2, 'primary/mul/mul35.png', '39', '39', 170, 0, 0),
(170, 6, 2, 'primary/mul/mul36.png', '658', '658', 171, 0, 0),
(171, 6, 2, 'primary/mul/mul37.png', '5496', '5496', 172, 0, 0),
(172, 6, 2, 'primary/mul/mul38.png', '3420', '3420', 173, 0, 0),
(173, 6, 2, 'primary/mul/mul39.png', '0', '0', 165, 0, 0),
(174, 6, 2, 'primary/mul/mul40.png', '680', '680', 1000, 0, 0),
(175, NULL, 2, 'primary/mul/mul40.png', '0', '0', 0, 0, 0),
(176, 6, 3, 'primary/mul/mul41.png', '41856', '41856', 177, 0, 0),
(177, 6, 3, 'primary/mul/mul42.png', '26967', '26967', 178, 0, 0),
(178, 6, 3, 'primary/mul/mul43.png', '11928', '11928', 179, 0, 0),
(179, 6, 3, 'primary/mul/mul44.png', '84832', '84832', 180, 0, 0),
(180, 6, 3, 'primary/mul/mul45.png', '38262', '38262', 181, 0, 0),
(181, 6, 3, 'primary/mul/mul46.png', '89547', '89547', 182, 0, 0),
(182, 6, 3, 'primary/mul/mul47.png', '7467', '7467', 183, 0, 0),
(183, 6, 3, 'primary/mul/mul48.png', '28020', '28020', 184, 0, 0),
(184, 6, 3, 'primary/mul/mul49.png', '435448', '435448', 185, 0, 0),
(185, 6, 3, 'primary/mul/mul50.png', '78313972', '78313972', 186, 0, 0),
(186, 6, 3, 'primary/mul/mul51.png', '78240', '78240', 200, 0, 0),
(187, 6, 3, 'primary/mul/mul52.png', '35380', '35380', 176, 0, 0),
(188, 6, 3, 'primary/mul/mul53.png', '32102889', '32102889', 187, 0, 0),
(189, 6, 3, 'primary/mul/mul54.png', '31744224', '31744224', 190, 0, 0),
(190, 6, 3, 'primary/mul/mul55.png', '21978', '21978', 191, 0, 0),
(191, 6, 3, 'primary/mul/mul56.png', '94656', '94656', 192, 0, 0),
(192, 6, 3, 'primary/mul/mul57.png', '73818', '73818', 193, 0, 0),
(193, 6, 3, 'primary/mul/mul58.png', '209392', '209392', 194, 0, 0),
(194, 6, 3, 'primary/mul/mul59.png', '74349', '74349', 195, 0, 0),
(195, 6, 3, 'primary/mul/mul60.png', '48274000', '48274000', 196, 0, 0),
(196, 6, 3, 'primary/mul/mul61.png', '8990226', '8990226', 197, 0, 0),
(197, 6, 3, 'primary/mul/mul62.png', '37278', '37278', 198, 0, 0),
(198, 6, 3, 'primary/mul/mul63.png', '174', '174', 199, 0, 0),
(199, 6, 3, 'primary/mul/mul64.png', '56088', '56088', 188, 0, 0),
(200, 6, 3, 'primary/mul/mul65.png', '7638', '7638', 1000, 0, 0),
(201, 7, 1, 'primary/div/div1.png\r\n', '3', '3', 214, 0, 0),
(202, 7, 1, 'primary/div/div2.png\r\n', '1', '1', 215, 0, 0),
(203, 7, 1, 'primary/div/div3.png\r\n', '1', '1', 202, 0, 0),
(204, 7, 1, 'primary/div/div4.png\r\n', '3', '3', 203, 0, 0),
(205, 7, 1, 'primary/div/div5.png\r\n', '7', '7', 204, 0, 0),
(206, 7, 1, 'primary/div/div6.png\r\n', '1', '1', 205, 0, 0),
(207, 7, 1, 'primary/div/div7.png\r\n', '2', '2', 206, 0, 0),
(208, 7, 1, 'primary/div/div8.png\r\n', '15', '15', 207, 0, 0),
(209, 7, 1, 'primary/div/div9.png\r\n', '12', '12', 208, 0, 0),
(210, 7, 1, 'primary/div/div10.png\r\n', '3', '3', 209, 0, 0),
(211, 7, 1, 'primary/div/div11.png\r\n', '5', '5', 210, 0, 0),
(212, 7, 1, 'primary/div/div12.png\r\n', '10', '10', 211, 0, 0),
(213, 7, 1, 'primary/div/div13.png\r\n', '16', '16', 212, 0, 0),
(214, 7, 1, 'primary/div/div14.png\r\n', '2', '2', 213, 0, 0),
(215, 7, 1, 'primary/div/div15.png\r\n', '1', '1', 1000, 0, 0),
(216, 7, 2, 'primary/div/div16.png\r\n', '137', '137', 217, 0, 0),
(217, 7, 2, 'primary/div/div17.png\r\n', '3', '3', 218, 0, 0),
(218, 7, 2, 'primary/div/div18.png\r\n', '1', '1', 219, 0, 0),
(219, 7, 2, 'primary/div/div19.png\r\n', '17', '17', 220, 0, 0),
(220, 7, 2, 'primary/div/div20.png\r\n', '12', '12', 221, 0, 0),
(221, 7, 2, 'primary/div/div21.png\r\n', '378', '378', 222, 0, 0),
(222, 7, 2, 'primary/div/div22.png\r\n', '282', '282', 223, 0, 0),
(223, 7, 2, 'primary/div/div23.png\r\n', '116', '116', 234, 0, 0),
(224, 7, 2, 'primary/div/div24.png\r\n', '646', '646', 216, 0, 0),
(225, 7, 2, 'primary/div/div25.png\r\n', '155', '155', 224, 0, 0),
(226, 7, 2, 'primary/div/div26.png\r\n', '107', '107', 227, 0, 0),
(227, 7, 2, 'primary/div/div27.png\r\n', '1126', '1126', 228, 0, 0),
(228, 7, 2, 'primary/div/div28.png\r\n', '12', '12', 229, 0, 0),
(229, 7, 2, 'primary/div/div29.png\r\n', '6', '6', 230, 0, 0),
(230, 7, 2, 'primary/div/div30.png\r\n', '36', '36', 231, 0, 0),
(231, 7, 2, 'primary/div/div31.png\r\n', '20', '20', 232, 0, 0),
(232, 7, 2, 'primary/div/div32.png\r\n', '41', '41', 233, 0, 0),
(233, 7, 2, 'primary/div/div33.png\r\n', '77', '77', 225, 0, 0),
(234, 7, 2, 'primary/div/div34.png\r\n', '1287', '1287', 1000, 0, 0),
(235, 7, 3, 'primary/div/div35.png\r\n', '46', '46', 236, 0, 0),
(236, 7, 3, 'primary/div/div36.png\r\n', '64', '64', 237, 0, 0),
(237, 7, 3, 'primary/div/div37.png\r\n', '16', '16', 238, 0, 0),
(238, 7, 3, 'primary/div/div38.png\r\n', '8', '8', 239, 0, 0),
(239, 7, 3, 'primary/div/div39.png\r\n', '11', '11', 240, 0, 0),
(240, 7, 3, 'primary/div/div40.png\r\n', '12', '12', 241, 0, 0),
(241, 7, 3, 'primary/div/div41.png\r\n', '2', '2', 242, 0, 0),
(242, 7, 3, 'primary/div/div42.png\r\n', '268', '268', 254, 0, 0),
(243, 7, 3, 'primary/div/div43.png\r\n', '20', '20', 235, 0, 0),
(244, 7, 3, 'primary/div/div44.png\r\n', '11', '11', 243, 0, 0),
(245, 7, 3, 'primary/div/div45.png\r\n', '9', '9', 244, 0, 0),
(246, 7, 3, 'primary/div/div46.png\r\n', '38', '38', 247, 0, 0),
(247, 7, 3, 'primary/div/div47.png\r\n', '13', '13', 248, 0, 0),
(248, 7, 3, 'primary/div/div48.png\r\n', '35', '35', 249, 0, 0),
(249, 7, 3, 'primary/div/div49.png\r\n', '11', '11', 250, 0, 0),
(250, 7, 3, 'primary/div/div50.png\r\n', '27', '27', 251, 0, 0),
(251, 7, 3, 'primary/div/div51.png\r\n', '106', '106', 252, 0, 0),
(252, 7, 3, 'primary/div/div52.png\r\n', '1913', '1913', 253, 0, 0),
(253, 7, 3, 'primary/div/div53.png\r\n', '73', '73', 245, 0, 0),
(254, 7, 3, 'primary/div/div54.png\r\n', '15', '15', 1000, 0, 0),
(255, 8, 1, 'primary/simb/simb1.png\r\n', '0', 'F', 266, 1, 0),
(256, 8, 1, 'primary/simb/simb2.png\r\n', '-1', 'V', 267, 1, 0),
(257, 8, 1, 'primary/simb/simb3.png', '0', 'Mayor', 256, 1, 0),
(258, 8, 1, 'primary/simb/simb4.png', '0', 'Mayor', 257, 1, 0),
(259, 8, 1, 'primary/simb/simb5.png', '0', 'Menor', 258, 1, 0),
(260, 8, 1, 'primary/simb/simb6.png', '0', 'Mayor', 259, 1, 0),
(261, 8, 1, 'primary/simb/simb7.png', '0', 'Menor', 260, 1, 0),
(262, 8, 1, 'primary/simb/simb8.png', '0', 'Mayor', 261, 1, 0),
(263, 8, 1, 'primary/simb/simb9.png', '0', 'Menor', 262, 1, 0),
(264, 8, 1, 'primary/simb/simb10.png', '0', 'Menor', 263, 1, 0),
(265, 8, 1, 'primary/simb/simb11.png', '0', 'Menor', 264, 1, 0),
(266, 8, 1, 'primary/simb/simb12.png', '0', 'V', 265, 1, 0),
(267, 8, 1, 'primary/simb/simb13.png', '0', 'Mayor', 1000, 1, 0),
(268, 8, 2, 'primary/simb/simb14.png', '0', 'V', 269, 1, 0),
(269, 8, 2, 'primary/simb/simb15.png', '0', 'F', 270, 1, 0),
(270, 8, 2, 'primary/simb/simb16.png', '0', 'V', 271, 1, 0),
(271, 8, 2, 'primary/simb/simb17.png', '0', 'V', 272, 1, 0),
(272, 8, 2, 'primary/simb/simb18.png', '0', 'F', 273, 1, 0),
(273, 8, 2, 'primary/simb/simb19.png', '0', 'V', 274, 1, 0),
(274, 8, 2, 'primary/simb/simb20.png', '0', 'V', 275, 1, 0),
(275, 8, 2, 'primary/simb/simb21.png', '0', 'F', 276, 1, 0),
(276, 8, 2, 'primary/simb/simb22.png', '0', 'V', 288, 1, 0),
(277, 8, 2, 'primary/simb/simb23.png', '0', 'V', 268, 1, 0),
(278, 8, 2, 'primary/simb/simb24.png', '0', 'V', 277, 1, 0),
(279, 8, 2, 'primary/simb/simb25.png\r\n', '0', 'V', 280, 1, 0),
(280, 8, 2, 'primary/simb/simb26.png\r\n', '0', 'V', 281, 1, 0),
(281, 8, 2, 'primary/simb/simb27.png\r\n', '0', 'F', 282, 1, 0),
(282, 8, 2, 'primary/simb/simb28.png\r\n', '0', 'V', 283, 1, 0),
(283, 8, 2, 'primary/simb/simb29.png\r\n', '0', 'F', 284, 1, 0),
(284, 8, 2, 'primary/simb/simb30.png\r\n', '0', 'F', 285, 1, 0),
(285, 8, 2, 'primary/simb/simb31.png\r\n', '0', 'V', 286, 1, 0),
(286, 8, 2, 'primary/simb/simb32.png\r\n', '0', 'V', 287, 1, 0),
(287, 8, 2, 'primary/simb/simb33.png\r\n', '0', 'V', 278, 1, 0),
(288, 8, 2, 'primary/simb/simb34.png\r\n', '0', 'F', 289, 1, 0),
(289, 8, 2, 'primary/simb/simb35.png\r\n', '0', 'Igual', 290, 1, 0),
(290, 8, 2, 'primary/simb/simb36.png', '0', 'Mayor', 291, 1, 0),
(291, 8, 2, 'primary/simb/simb37.png\r\n', '0', 'Igual', 1000, 1, 0),
(312, 8, 3, 'primary/simb/simb38.png', '0', 'Mayor', 313, 1, 0),
(313, 8, 3, 'primary/simb/simb39.png', '0', 'Igual', 314, 1, 0),
(314, 8, 3, 'primary/simb/simb40.png', '0', 'Igual', 315, 1, 0),
(315, 8, 3, 'primary/simb/simb41.png', '0', 'Mayor', 320, 1, 0),
(316, 8, 3, 'primary/simb/simb42.png', '0', 'Igual', 312, 1, 0),
(317, 8, 3, 'primary/simb/simb43.png', '0', 'Igual', 316, 1, 0),
(318, 8, 3, 'primary/simb/simb44.png', '0', 'Mayor', 317, 1, 0),
(319, 8, 3, 'primary/simb/simb45.png', '0', 'Igual', 318, 1, 0),
(320, 8, 3, 'primary/simb/simb46.png', '0', 'Igual', 1000, 1, 0),
(321, 9, 1, 'primary/frac/fr1.png\r\n', '0', '1slash2', 322, 0, 1),
(322, 9, 1, 'primary/frac/fr2.png\r\n', '1', '1slash1', 324, 0, 0),
(323, 9, 1, 'primary/frac/fr3.png\r\n', '5', '5slash1', 325, 0, 0),
(324, 9, 1, 'primary/frac/fr4.png\r\n', '0', '2slash5', 323, 0, 1),
(325, 9, 1, 'primary/frac/fr5.png\r\n', '0', '28slash3', 328, 0, 1),
(326, 9, 1, 'primary/frac/fr6.png', '0', '1slash6', 327, 0, 0),
(327, 9, 1, 'primary/frac/fr7.png', '0', '7slash9', 329, 0, 0),
(328, 9, 1, 'primary/frac/fr8.png', '0', '16slash33', 326, 0, 0),
(329, 9, 1, 'primary/frac/fr9.png', '0', '11slash10', 330, 0, 0),
(330, 9, 1, 'primary/frac/fr10.png', '0', '2slash3', 332, 0, 0),
(331, 9, 1, 'primary/frac/fr11.png', '3', '3slash1', 332, 0, 0),
(332, 9, 1, 'primary/frac/fr12.png', '0', '15slash8', 344, 0, 1),
(333, 9, 1, 'primary/frac/fr13.png', '2', '2slash1', 340, 0, 0),
(334, 9, 1, 'primary/frac/fr14.png', '0', '6slash13', 335, 0, 0),
(335, 9, 1, 'primary/frac/fr15.png', '0', '50slash27', 338, 0, 0),
(336, 9, 1, 'primary/frac/fr16.png', '0', '20slash9', 337, 0, 0),
(337, 9, 1, 'primary/frac/fr17.png', '0', '2slash5', 1000, 0, 0),
(338, 9, 1, 'primary/frac/fr18.png', '0', '3slash4', 336, 0, 0),
(339, 9, 1, 'primary/frac/fr19.png', '0', '7slash9', 334, 0, 0),
(340, 9, 1, 'primary/frac/fr20.png', '0', '25slash9', 339, 0, 0),
(341, 9, 1, 'primary/frac/fr21.png', '0', '2slash7', 333, 0, 0),
(342, 9, 1, 'primary/frac/fr22.png', '0', '1slash2', 341, 0, 0),
(343, 9, 1, 'primary/frac/fr23.png', '0', '5slash9', 342, 0, 0),
(344, 9, 1, 'primary/frac/fr24.png', '4', '4slash1', 343, 0, 0),
(345, 9, 1, 'primary/frac/fr25.png', '0', '9slash50', 321, 0, 1),
(346, 9, 2, 'primary/frac/fr34.png', '4', '4slash1', 360, 0, 0),
(347, 9, 2, 'primary/frac/fr27.png', '0', '23slash2', 346, 0, 0),
(348, 9, 2, 'primary/frac/fr28.png', '0', '23slash7', 347, 0, 0),
(349, 9, 2, 'primary/frac/fr29.png', '0', '61slash8', 348, 0, 0),
(350, 9, 2, 'primary/frac/fr30.png', '0', '179slash12', 349, 0, 0),
(351, 9, 2, 'primary/frac/fr31.png', '0', '29slash6', 350, 0, 0),
(352, 9, 2, 'primary/frac/fr32.png', '0', '68slash45', 351, 0, 0),
(353, 9, 2, 'primary/frac/fr33.png', '21', '21slash1', 352, 0, 0),
(354, 9, 2, 'primary/frac/fr26.png', '0', '13slash22', 355, 0, 0),
(355, 9, 2, 'primary/frac/fr35.png', '0', '35slash4', 356, 0, 1),
(356, 9, 2, 'primary/frac/fr36.png', '25', '25', 357, 0, 0),
(357, 9, 2, 'primary/frac/fr37.png', '1', '1', 358, 0, 0),
(358, 9, 2, 'primary/frac/fr38.png', '0', '12slash5', 359, 0, 0),
(359, 9, 2, 'primary/frac/fr39.png', '0', '34slash5', 353, 0, 0),
(360, 9, 2, 'primary/frac/fr40.png', '0', '9slash20', 1000, 0, 0),
(361, 9, 3, 'primary/frac/fr41.png\r\n', '0', '68slash3', 369, 0, 0),
(362, 9, 3, 'primary/frac/fr42.png\r\n', '321', '11slash2', 361, 0, 0),
(363, 9, 3, 'primary/frac/fr43.png\r\n', '321231321', '51slash10', 362, 0, 0),
(364, 9, 3, 'primary/frac/fr44.png\r\n', '53', '53slash7', 363, 0, 0),
(365, 9, 3, 'primary/frac/fr45.png\r\n', '1', '0', 364, 0, 0),
(366, 9, 3, 'primary/frac/fr46.png\r\n', '0', '14slash3', 365, 0, 0),
(367, 9, 3, 'primary/frac/fr47.png\r\n', '0', '170slash21', 366, 0, 0),
(368, 9, 3, 'primary/frac/fr48.png\r\n', '0', '1slash2', 367, 0, 1),
(369, 9, 3, 'primary/frac/fr49.png\r\n', '1', '1slash1', 1000, 0, 0),
(370, 10, 1, 'primary/poten/pot1.png', '4', '4', 379, 0, 1),
(371, 10, 1, 'primary/poten/pot2.png', '4', '4', 1000, 0, 0),
(372, 10, 1, 'primary/poten/pot3.png', '7', '7', 371, 0, 0),
(373, 10, 1, 'primary/poten/pot4.png', '5', '5', 372, 0, 0),
(374, 10, 1, 'primary/poten/pot5.png', '3', '3', 373, 0, 0),
(375, 10, 1, 'primary/poten/pot6.png', '7', '7', 374, 0, 0),
(376, 10, 1, 'primary/poten/pot7.png', '9', '9', 375, 0, 0),
(377, 10, 1, 'primary/poten/pot8.png', '3', '3', 376, 0, 0),
(378, 10, 1, 'primary/poten/pot9.png', '10000', '10000', 377, 0, 0),
(379, 10, 1, 'primary/poten/pot10.png', '1', '1', 378, 0, 0),
(380, 10, 2, 'primary/poten/pot11.png', '9', '9', 381, 0, 0),
(381, 10, 2, 'primary/poten/pot12.png', '20', '20', 382, 0, 0),
(382, 10, 2, 'primary/poten/pot13.png', '6', '6', 383, 0, 0),
(383, 10, 2, 'primary/poten/pot14.png', '3', '3', 384, 0, 0),
(384, 10, 2, 'primary/poten/pot15.png', '27', '27', 385, 0, 0),
(385, 10, 2, 'primary/poten/pot16.png', '3125', '3125', 386, 0, 0),
(386, 10, 2, 'primary/poten/pot17.png', '6103515625', '6103515625', 387, 0, 0),
(387, 10, 2, 'primary/poten/pot18.png', '0', '64slash81', 389, 0, 0),
(388, 10, 2, 'primary/poten/pot19.png', '3', '3', 380, 0, 1),
(389, 10, 2, 'primary/poten/pot20.png', '36', '36', 390, 0, 0),
(390, 10, 2, 'primary/poten/pot21.png', '2359296', '2359296', 391, 0, 0),
(391, 10, 2, 'primary/poten/pot22.png', '256', '256', 392, 0, 0),
(392, 10, 2, 'primary/poten/pot23.png', '0', '1600slash27', 393, 0, 0),
(393, 10, 2, 'primary/poten/pot24.png', '0', '1slash729', 1000, 0, 0),
(394, 10, 3, 'primary/poten/pot24.png\r\n', '0', '1slash729', 395, 0, 0),
(395, 10, 3, 'primary/poten/pot25.png', '0', '2097152', 396, 0, 0),
(396, 10, 3, 'primary/poten/pot26.png', '36', '36', 397, 0, 0),
(397, 10, 3, 'primary/poten/pot27.png', '1', '1', 398, 0, 0),
(398, 10, 3, 'primary/poten/pot28.png', '0', '0', 1000, 0, 0),
(399, 11, 1, 'primary/rad/r1.png', '5', '5', 400, 0, 0),
(400, 11, 1, 'primary/rad/r2.png', '4', '4', 401, 0, 0),
(401, 11, 1, 'primary/rad/r3.png', '3', '3', 402, 0, 0),
(402, 11, 1, 'primary/rad/r4.png', '10', '10', 403, 0, 0),
(403, 11, 1, 'primary/rad/r5.png', '2', '2', 404, 0, 0),
(404, 11, 1, 'primary/rad/r6.png', '9', '9', 405, 0, 0),
(405, 11, 1, 'primary/rad/r7.png', '8', '8', 406, 0, 0),
(406, 11, 1, 'primary/rad/r8.png', '7', '7', 407, 0, 0),
(407, 11, 1, 'primary/rad/r9.png', '6', '6', 408, 0, 0),
(408, 11, 1, 'primary/rad/r10.png', '100', '100', 1000, 0, 0),
(409, 11, 2, 'primary/rad/r11.png', '2', '3slash2', 410, 0, 0),
(410, 11, 2, 'primary/rad/r12.png', '12', '12', 418, 0, 0),
(411, 11, 2, 'primary/rad/r13.png', '2', '2', 414, 0, 0),
(412, 11, 2, 'primary/rad/r14.png', '18', '18', 1000, 0, 0),
(413, 11, 2, 'primary/rad/r15.png', '30', '30', 412, 0, 0),
(414, 11, 2, 'primary/rad/r16.png', '36', '36', 413, 0, 0),
(415, 11, 2, 'primary/rad/r17.png', '2', '2', 411, 0, 0),
(416, 11, 2, 'primary/rad/r18.png', '8', '8', 409, 0, 0),
(417, 11, 2, 'primary/rad/r19.png', '3', '3', 416, 0, 0),
(418, 11, 2, 'primary/rad/r20.png', '9', '9', 415, 0, 0),
(419, 11, 3, 'primary/rad/r21.png', '92', '92', 420, 0, 0),
(420, 11, 3, 'primary/rad/r22.png', '86', '86', 421, 0, 0),
(421, 11, 3, 'primary/rad/r23.png', '30', '30', 422, 0, 0),
(422, 11, 3, 'primary/rad/r24.png', '34', '34', 1000, 0, 0),
(423, 12, 1, 'primary/proce/p1.png', '8', '8', 424, 0, 1),
(424, 12, 1, 'primary/proce/p2.png\r\n', '13', '13', 431, 0, 0),
(425, 12, 1, 'primary/proce/p3.png\r\n', '184', '184', 428, 0, 1),
(426, 12, 1, 'primary/proce/p4.png\r\n', '28', '28', 1000, 0, 0),
(427, 12, 1, 'primary/proce/p5.png\r\n', '23', '23', 426, 0, 0),
(428, 12, 1, 'primary/proce/p6.png\r\n', '227', '227', 427, 0, 0),
(429, 12, 1, 'primary/proce/p7.png\r\n', '0', '0', 425, 0, 0),
(430, 12, 1, 'primary/proce/p8.png\r\n', '17', '17', 429, 0, 0),
(431, 12, 1, 'primary/proce/p9.png\r\n', '14', '14', 430, 0, 0),
(432, 12, 2, 'primary/proce/p10.png\r\n', '0', '0', 435, 0, 0),
(433, 12, 2, 'primary/proce/p13.png', '109', '109', 1000, 0, 0),
(434, 12, 2, 'primary/proce/p14.png', '1', '1', 433, 0, 0),
(435, 12, 2, 'primary/proce/p15.png', '10', '1', 434, 0, 1),
(436, 12, 3, 'primary/proce/p16.png', '16', '16', 438, 0, 0),
(437, 12, 3, 'primary/proce/p17.png', '0', '0', 1000, 0, 0),
(438, 12, 3, 'primary/proce/p18.png', '32', '65slash2', 437, 0, 0),
(439, 13, 1, 'primary/rect/recta1.png', '4', '4', 440, 0, 0),
(440, 13, 1, 'primary/rect/recta2.png', '8', '8', 441, 0, 0),
(441, 13, 1, 'primary/rect/recta3.png', '1', '1', 446, 0, 0),
(442, 13, 1, 'primary/rect/recta4.png', '5', '5', 445, 0, 0),
(443, 13, 1, 'primary/rect/recta5.png', '0', '0', 444, 0, 0),
(444, 13, 1, 'primary/rect/recta6.png', '-5', 'rest5', 1000, 0, 0),
(445, 13, 1, 'primary/rect/recta7.png', '0', '0', 443, 0, 0),
(446, 13, 1, 'primary/rect/recta8.png', '-3', 'rest3', 442, 0, 0),
(447, 13, 2, 'primary/rect/recta9.png', '2', '1,5', 453, 0, 0),
(448, 13, 2, 'primary/rect/recta10.png', '9', '9', 449, 0, 0),
(449, 13, 2, 'primary/rect/recta11.png\r\n', '4', '4,5', 450, 0, 0),
(450, 13, 2, 'primary/rect/recta14.png\r\n', '4', '4,5', 1000, 0, 0),
(451, 13, 2, 'primary/rect/recta15.png\r\n', '-9', 'rest9', 448, 0, 0),
(452, 13, 2, 'primary/rect/recta16.png', '-13', 'rest13', 447, 0, 0),
(453, 13, 2, 'primary/rect/recta18.png', '-16', 'rest16', 451, 0, 0),
(454, 13, 3, 'primary/rect/recta19.png', '4', '4,5', 458, 0, 0),
(455, 13, 3, 'primary/rect/recta20.png', '10', '10', 457, 0, 0),
(456, 13, 3, 'primary/rect/recta21.png', '2', '2', 455, 0, 0),
(457, 13, 3, 'primary/rect/recta22.png', '1', '1', 1000, 0, 0),
(458, 13, 3, 'primary/rect/recta23.png', '5', '5', 456, 0, 0),
(459, 14, 1, 'Geometry/Peri/peri1.png', '12', '12', 460, 0, 1),
(460, 14, 1, 'Geometry/Peri/peri2.png', '24', '24', 461, 0, 0),
(461, 14, 1, 'Geometry/Peri/peri3.png', '15', '15', 462, 0, 0),
(462, 14, 1, 'Geometry/Peri/peri4.png', '21', '21', 463, 0, 0),
(463, 14, 1, 'Geometry/Peri/peri5.png', '125', '[ 125,664 125,66  125,6 125,] ', 464, 0, 1),
(464, 14, 1, 'Geometry/Peri/peri6.png', '164', '164', 465, 0, 0),
(465, 14, 1, 'Geometry/Peri/peri7.png', '20', '[20,734 20,73 20,7 20, 20 ]', 1000, 0, 0),
(466, 14, 2, 'Geometry/Peri/peri8.png', '35', '[35,708 35,70 35,7 35]', 467, 0, 1),
(467, 14, 2, 'Geometry/Peri/peri9.png', '25', '[41,132 41,13 41,1 41, 41]', 468, 0, 1),
(468, 14, 2, 'Geometry/Peri/peri10.png', '70', '[70,132 70,13 70,1 70, 70]', 469, 0, 0),
(469, 14, 2, 'Geometry/Peri/peri11.png', '21', '21', 471, 0, 0),
(470, 14, 2, 'Geometry/Peri/peri12.png', '16', '16', 1000, 0, 0),
(471, 14, 2, 'Geometry/Peri/peri13.png', '32', '32', 470, 0, 0),
(472, 14, 2, 'Geometry/Peri/peri14.png', '129', '129', 466, 0, 0),
(473, 14, 3, 'Geometry/Peri/peri15.png', '314', '314,6', 1000, 0, 0),
(474, 15, 1, 'Geometry/Area/area1.png', '16', '16', 478, 0, 1),
(475, 15, 1, 'Geometry/Area/area2.png', '52', '52,5', 1000, 0, 0),
(476, 15, 1, 'Geometry/Area/area3.png', '7854', '[7853,98 7853,9 7853, 7853 ]', 477, 0, 1),
(477, 15, 1, 'Geometry/Area/area4.png', '64', '64', 475, 0, 0),
(478, 15, 1, 'Geometry/Area/area5.png', '50894', '[50893,92 50893,9 50893, 50893]', 476, 0, 0),
(479, 15, 3, 'Geometry/Area/area13.png', '21', '[20,566 20,56 20,5 20, 20]', 487, 0, 0),
(480, 15, 2, 'Geometry/Area/area7.png', '300', '300', 481, 0, 0),
(481, 15, 2, 'Geometry/Area/area8.png', '4800', '4800', 482, 0, 0),
(482, 15, 2, 'Geometry/Area/area9.png', '1050', '1050', 484, 0, 0),
(483, 15, 2, 'Geometry/Area/area10.png', '4924', '[ 4924,23 4924,2 4924, 4924 ]', 1000, 0, 0),
(484, 15, 2, 'Geometry/Area/area11.png', '9642', '[9641,570 9641,57 9641,5 9641 ]', 483, 0, 11),
(485, 15, 2, 'Geometry/Area/area12.png', '40', '40', 486, 0, 0),
(486, 15, 2, 'Geometry/Area/area6.png', '1800', '1800', 480, 0, 1),
(487, 15, 3, 'Geometry/Area/area14.png', '13', '[13,735 13,73 13,7 13,]', 490, 0, 0),
(488, 16, 1, 'Geometry/Cartesiano/plano1.png', '2', 'star', 489, 2, 0),
(489, 16, 1, 'Geometry/Cartesiano/plano3.png', '2', 'rocket', 491, 2, 0),
(490, 15, 3, 'Geometry/Area/area15.png', '268', '268', 1000, 0, 0),
(491, 16, 1, 'Geometry/Cartesiano/plano4.png', '0', 'rocket', 493, 2, 0),
(492, 16, 1, 'Geometry/Cartesiano/plano5.png', '0', 'robot', 494, 2, 0),
(493, 16, 1, 'Geometry/Cartesiano/plano8.png', '0', 'rocket', 495, 2, 0),
(494, 16, 1, 'Geometry/Cartesiano/plano9.png', '0', 'robot', 496, 2, 0),
(495, 16, 1, 'Geometry/Cartesiano/plano10.png', '0', 'robot', 492, 2, 0),
(496, 16, 1, 'Geometry/Cartesiano/plano11.png', '4', 'IV', 1000, 3, 0),
(498, 16, 2, 'Geometry/Cartesiano/plano13.png', '0', '[4,4 popen4,4pclose popen4,4 4,4pclose]', 499, 0, 0),
(499, 16, 2, 'Geometry/Cartesiano/plano14.png', '0', '[3,2 popen3,2pclose popen3,2 3,2pclose]', 500, 0, 0),
(500, 16, 2, 'Geometry/Cartesiano/plano15.png', '0', '[4,rest4  popen4,rest4pclose open4,rest4 4,rest4pclose]', 1000, 0, 0),
(505, 16, 2, 'Geometry/Cartesiano/plano16.png', '0', 'robot', 498, 2, 0),
(506, 16, 2, 'Geometry/Cartesiano/plano17.png', '0', '[popen0,0pclose 0,0  0,pclose  popen0,0 ]', 505, 0, 0),
(508, 16, 3, 'Geometry/Cartesiano/plano18.png', '8888', 'rest4,rest4', 509, 0, 0),
(509, 16, 3, 'Geometry/Cartesiano/plano22.png', '0', 'I', 511, 3, 0),
(511, 16, 3, 'Geometry/Cartesiano/plano23.png', '150', '150', 1000, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `theme`
--

CREATE TABLE `theme` (
  `id` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(446) COLLATE utf8_unicode_ci NOT NULL,
  `unloker` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `theme`
--

INSERT INTO `theme` (`id`, `section`, `name`, `source`, `description`, `unloker`) VALUES
(1, 0, '¿Qué son los núnmeros?', '[]', '', 0),
(2, 0, '¿Para qué sirven los números?', '[]', '', 0),
(3, 0, 'Tipos de numeros', '[]', '', 0),
(4, 1, 'Suma', '[\"https://www.youtube.com/embed/WAucYao8whY\",\"https://www.youtube.com/embed/IpJIizodvqA\",\"https://www.youtube.com/embed/9KkeA7TPJqE\",\"sum.png\"]', 'La suma es una de las operaciones más útiles, las utilizamos en nuestra vida diaria, para hacer compras, para conocer la cantidad de productos, bienes o servicios que tenemos. La suma es un proceso de Adición el cual toda persona debería dominar debido a su gran importancia en nuestro entorno. En esta sección aprenderás el proceso de suma y ¿Sabes qué? ¡Es muy fácil!', 5),
(5, 1, 'Resta', '[\"https://www.youtube.com/embed/BWK6NLFQYzA\",\"https://www.youtube.com/embed/rhgytE4uNtk\",\"resta.jpg\"]', 'Cuando hablamos de resta, nos referimos al proceso contrario de la suma, es decir, si la suma es añadir, la resta es quitar, este proceso también es muy útil en nuestro entorno, es muy utilizado en la vida real y generalmente la empleamos para conocer la cantidad de lo que tenemos después de que nos lo han quitado o reducido de alguna manera.', 114),
(6, 1, 'Multiplicación', '[\"https://www.youtube.com/embed/CpBVPMBXvt4\",\"multiplicacion.jpg\"]', 'La multiplicación es otra manera de sumar. ¿Qué pasa cuando recibes la misma cantidad de dinero durante varios días? Para este tipo de problemas utilizamos la multiplicación, donde en realidad lo que estamos haciendo es sumar la cantidad de dinero tantas veces como la cantidad de días que lo recibirás.', 174),
(7, 1, 'División', '[\"https://www.youtube.com/embed/PCRCrdJbaCM\",\"https://www.youtube.com/embed/L-JagStWnbQ\",\"division.jpg\"]', 'La división es un proceso matemático para repartir una cantidad en partes iguales. En esta sección podrás practicar la división desde el nivel principiante hasta el avanzado. Al principio puede ser un poco intimidante, sin embargo luego de un poco de práctica podrás dominar esta técnica. ', 234),
(8, 1, 'Simbología I', '[\"https://www.youtube.com/embed/824x8dJuhU8\",\"mayor_menor.jpg\"]', 'En matemática existen un montón de símbolos interesantes los cuales tienen un significado y una aplicación en la aritmética. ¡No te preocupes! Estos símbolos no son difíciles de aprender y te resultarán enormemente útiles en la práctica. Además, estos símbolos son universales (Esto quiere decir que se reconocen en todo el mundo)', 291),
(9, 1, 'Fraccionarios', '[\"https://www.youtube.com/embed/JNHJVghhmxY\",\"https://www.youtube.com/embed/KDDcZCvgx5k\"]', '¿Qué pasa cuando tienes que repartir una sola cosa en partes iguales? Como podrás notar, los fraccionarios y las divisiones son el mismo proceso, sin embargo, solemos utilizar los fraccionarios para dividir una unidad (una cosa) en partes iguales. Por ejemplo, la torta de tu cumpleaños', 360),
(10, 1, 'Potenciación', '[\"pot1.jpg\"]', 'Imagina que una bacteria se divide en dos. Luego esas dos bacterias se dividen cada una en otras 2, luego estas cuatro bacterias se dividen cada una en dos. ¿Cómo se calcula la cantidad de bacterias que habrá en un determinado momento? Para este proceso utilizaremos la potenciación.', 393),
(11, 1, 'Radicación', '[\"Rad1.png\",\"Rad2.png\",\"Rad3.png\"]', 'En ocasiones, necesitamos conocer en la base de una potencia, ¿Lo notas? La radicación es el proceso contrario a la potenciación. A continuación, te presentamos una sección de ejercicios para que practiques esta técnica matemática que te será muy útil en el futuro.', 412),
(12, 1, 'Orden de evaluación o Leyes de precedencia', '[\"precedencia.png\"]', '¿Y si nos encontramos con un proceso que tiene muchas sumas, restas, multiplicaciones y divisiones? ¿Cómo podemos resolver todo este problema? ¿Por dónde empiezo? Bueno, afortunadamente existen las leyes de precedencia o también conocidas como orden de evaluación, En esta sección aprenderás la manera correcta de solucionar dichos problemas', 433),
(13, 1, 'Recta numérica y Plano cartesiano', '[]', 'La recta numérica es el primer paso para adentrarnos al maravilloso mundo de los números enteros. ¿Alguna vez has escuchado hablar de números negativos? Seguramente sí, La recta numérica representa el punto de quiebre entre los números negativos y positivos, siendo el cero el punto neutro entre estos dos maravillosos conjuntos.', 450),
(14, 2, 'Perimetros', '[\"perimetro.png\"]', 'Pongamos en práctica el cálculo de petrimetros', 470),
(15, 2, 'Areas', '[]', 'El area es la cantidad de espacio (en segunda dimensión) que ocupa una figura.', 483),
(16, 2, 'Plano Cartesiano', '[\"https://www.youtube.com/embed/kzOzYY-T-50\"]', '  para la matemática, el plano cartesiano es sumamente importante debido a sus muchas aplicaciones.\r\n\r\nLa función general de esta herramienta en la matemática, es que permite representar la gráfica de cualquier función.', 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `statistics_id` int(11) DEFAULT NULL,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `solved_exercises` varchar(9000) COLLATE utf8_unicode_ci NOT NULL,
  `available_themes` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `starts` smallint(6) NOT NULL,
  `img_profile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `board_kind` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `statistics_id`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `confirmation_token`, `password_requested_at`, `roles`, `solved_exercises`, `available_themes`, `starts`, `img_profile`, `board_kind`) VALUES
(2, 1, 'dbastidas', 'dbastidas', 'diego.fernando.bastidas@correounivalle.edu.co', 'diego.fernando.bastidas@correounivalle.edu.co', 1, NULL, '$2y$13$f.GbQLAyBDlNRJpcbMYF2.jXccM9KCoGrcxiSxPit6dRwx21j8S.q', '2019-02-21 00:08:43', NULL, NULL, 'a:1:{i:0;s:10:\"ROLE_ADMIN\";}', '[\"17\",\"18\",\"19\",\"20\",\"21\",\"29\",\"30\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"16\",\"15\",\"14\",\"13\",\"12\",\"11\",\"4\",\"6\",\"43\",\"42\",\"44\",\"41\",\"40\",\"39\",\"45\",\"46\",\"47\",\"48\",\"52\",\"51\",\"50\",\"49\",\"38\",\"37\",\"7\",\"8\",\"3\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"5\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"59\",\"58\",\"57\",\"56\",\"55\",\"54\",\"53\",\"9\",\"10\",\"67\",\"68\",\"82\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"81\",\"80\",\"79\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"92\",\"105\",\"106\",\"107\",\"108\",\"109\",\"110\",\"111\",\"112\",\"113\",\"104\",\"103\",\"102\",\"93\",\"94\",\"95\",\"96\",\"97\",\"98\",\"99\",\"100\",\"101\",\"114\",\"126\",\"127\",\"128\",\"129\",\"130\",\"131\",\"132\",\"133\",\"125\",\"124\",\"123\",\"115\",\"116\",\"117\",\"118\",\"119\",\"120\",\"121\",\"122\",\"134\",\"135\",\"146\",\"147\",\"148\",\"149\",\"150\",\"151\",\"152\",\"153\",\"145\",\"144\",\"136\",\"137\",\"138\",\"139\",\"140\",\"141\",\"142\",\"143\",\"154\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"165\",\"164\",\"163\",\"155\",\"156\",\"157\",\"158\",\"159\",\"160\",\"161\",\"162\",\"174\",\"189\",\"190\",\"191\",\"192\",\"193\",\"194\",\"195\",\"196\",\"197\",\"198\",\"199\",\"188\",\"187\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\",\"200\",\"201\",\"214\",\"213\",\"212\",\"211\",\"210\",\"209\",\"208\",\"207\",\"206\",\"205\",\"204\",\"203\",\"202\",\"215\",\"226\",\"227\",\"228\",\"229\",\"230\",\"231\",\"232\",\"233\",\"225\",\"224\",\"216\",\"217\",\"218\",\"219\",\"220\",\"221\",\"222\",\"223\",\"234\",\"246\",\"247\",\"248\",\"249\",\"250\",\"251\",\"252\",\"253\",\"245\",\"244\",\"243\",\"235\",\"236\",\"237\",\"238\",\"239\",\"240\",\"241\",\"242\",\"254\",\"255\",\"256\",\"266\",\"265\",\"264\",\"263\",\"262\",\"261\",\"260\",\"259\",\"258\",\"257\",\"267\",\"279\",\"280\",\"281\",\"282\",\"283\",\"284\",\"285\",\"286\",\"287\",\"278\",\"277\",\"268\",\"269\",\"270\",\"271\",\"272\",\"273\",\"274\",\"275\",\"276\",\"288\",\"289\",\"290\",\"291\",\"321\",\"322\",\"323\",\"335\",\"336\",\"337\",\"338\",\"339\",\"340\",\"341\",\"342\",\"343\",\"344\",\"334\",\"333\",\"332\",\"324\",\"325\",\"326\",\"327\",\"328\",\"329\",\"330\",\"331\",\"345\",\"354\",\"355\",\"356\",\"357\",\"358\",\"359\",\"353\",\"352\",\"351\",\"350\",\"349\",\"348\",\"347\",\"346\",\"360\",\"28\",\"319\",\"318\",\"317\",\"316\",\"312\",\"313\",\"314\",\"315\",\"320\",\"361\",\"368\",\"369\",\"367\",\"366\",\"365\",\"364\",\"363\",\"362\",\"370\",\"379\",\"378\",\"377\",\"376\",\"375\",\"374\",\"373\",\"372\",\"371\",\"388\",\"381\",\"382\",\"383\",\"384\",\"385\",\"386\",\"387\",\"389\",\"390\",\"391\",\"392\",\"393\",\"380\",\"394\",\"395\",\"396\",\"397\",\"398\",\"399\",\"400\",\"401\",\"402\",\"403\",\"404\",\"405\",\"406\",\"407\",\"408\",\"417\",\"416\",\"413\",\"409\",\"410\",\"418\",\"415\",\"411\",\"414\",\"412\",\"419\",\"420\",\"421\",\"422\",\"423\",\"424\",\"431\",\"430\",\"429\",\"425\",\"428\",\"427\",\"426\",\"432\",\"435\",\"434\",\"433\",\"436\",\"438\",\"437\",\"439\",\"440\",\"441\",\"446\",\"442\",\"445\",\"443\",\"444\",\"447\",\"452\",\"453\",\"451\",\"448\",\"449\",\"454\",\"458\",\"456\",\"455\",\"457\",\"450\",\"459\",\"460\",\"461\",\"462\",\"463\",\"464\",\"465\",\"472\",\"466\",\"467\",\"468\",\"469\",\"471\",\"470\",\"474\",\"486\",\"480\",\"481\",\"482\",\"484\",\"483\",\"478\",\"476\",\"477\",\"475\",\"479\",\"487\",\"488\",\"490\",\"508\",\"509\",\"511\",\"489\",\"491\",\"493\",\"495\",\"492\",\"494\",\"496\",\"506\",\"505\",\"498\",\"499\",\"500\"]', '[4,\"5\",6,7,8,9,10,11,12,13,14,15,15,16,16]', 2, 'DELjajceTqS49t8BLLACBjSFi8OCdM8H.png', 0),
(13, 2, 'dbastidas150', 'dbastidas150', 'diegofernando150_@hotmail.es', 'diegofernando150_@hotmail.es', 1, NULL, '$2y$13$0d9hk4oiTQg4QJZV3sna5.WtJSXheK80rFBogaZfJBT7JjkoXjTK2', '2019-01-30 19:17:11', NULL, NULL, 'a:0:{}', '[\"19\"]', '[4]', 0, 'dQeRRM5LcuEJNFiFgsUVbkbXUFVASuHp.png', 0),
(14, 4, 'mauro', 'mauro', 'maurobastidas@hotmail.com', 'maurobastidas@hotmail.com', 1, NULL, '$2y$13$6ZLkqZnu/z65u8sGSFGDWuYjBv5PbwNWBtCsvgq5DJcqQrRUjI/1S', '2018-07-05 23:19:08', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\",\"22\"]', '[4]', 0, 'pBDfywqhUhJEALgPIr4oxaN2QlivF3Nm.png', 1),
(15, 5, 'dahiana', 'dahiana', 'dahiana@gmail.com', 'dahiana@gmail.com', 1, NULL, '$2y$13$ZfSVsVcKDji3PoRj0v1sSO.EDoW8457JmPdJqc33AxxFjZ8DgFOQ.', '2018-05-09 22:52:45', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\",\"22\"]', '[4]', 1, 'PQGOw4w3alQylItB5Ci3b910lwl4hFqr.png', 1),
(16, 6, 'test', 'test', 'test@correounivalle.edu.co', 'test@correounivalle.edu.co', 1, NULL, '$2y$13$UFcosNk32FSNzB4C7oROw.CXZqzBJuMHBhYKGHryeYqs1Sj53b6ZO', '2018-07-11 01:33:57', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\",\"368\"]', '[4]', 0, 'Rk3PCvRpIXzNYVfhpYAs4eNIOq9tDu0w.png', 1),
(17, 7, 'Djaramillo', 'djaramillo', 'diana.jaramillo@live.com', 'diana.jaramillo@live.com', 1, NULL, '$2y$13$MKpd5kqoGQyp0tlDsDLyIelL7cBu0u24WeG4l4VpOeEyN49hO/dNu', '2018-10-28 23:47:43', NULL, NULL, 'a:0:{}', '[\"44\",\"41\",\"40\",\"39\",\"45\",\"46\",\"47\",\"48\",\"52\",\"51\",\"50\",\"49\",\"38\",\"37\",\"7\",\"8\",\"3\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"5\"]', '[4,5,5]', 0, 'Qn99ggU2n76PvM3adhK3a7SRktpVb2fM.png', 1),
(18, 8, 'ncalero', 'ncalero', 'nandreach@hotmail.com', 'nandreach@hotmail.com', 1, NULL, '$2y$13$GsSh60dr7IvZbpZ4C.dmJun8cJ.Th66824jUVqUW1R978JfD5AZp2', '2018-10-28 23:47:04', NULL, NULL, 'a:0:{}', '[\"17\",\"18\",\"19\",\"20\",\"21\",\"29\",\"30\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"16\",\"15\",\"14\",\"13\",\"12\",\"11\",\"4\",\"6\",\"43\",\"42\",\"44\",\"41\",\"40\",\"39\",\"45\",\"46\",\"47\",\"48\",\"52\",\"51\",\"50\",\"49\",\"38\",\"37\",\"7\",\"8\",\"3\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"5\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"59\",\"58\",\"57\",\"56\",\"55\",\"54\",\"53\",\"9\",\"10\",\"67\",\"68\",\"82\",\"83\",\"84\",\"85\",\"86\",\"87\",\"88\",\"89\",\"90\",\"91\",\"81\",\"80\",\"79\",\"69\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"77\",\"78\",\"92\",\"105\",\"106\",\"107\",\"108\",\"109\",\"110\",\"111\",\"112\",\"113\",\"104\",\"103\",\"102\",\"93\",\"94\",\"95\",\"96\",\"97\",\"98\",\"99\",\"100\",\"101\",\"114\",\"126\",\"127\",\"128\",\"129\",\"130\",\"131\",\"132\",\"133\",\"125\",\"124\",\"123\",\"115\",\"116\",\"117\",\"118\",\"119\",\"120\",\"121\",\"122\",\"134\",\"135\",\"146\",\"147\",\"148\",\"149\",\"150\",\"151\",\"152\",\"153\",\"145\",\"144\",\"136\",\"137\",\"138\",\"139\",\"140\",\"141\",\"142\",\"143\",\"154\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"165\",\"164\",\"163\",\"155\",\"156\",\"157\",\"158\",\"159\",\"160\",\"161\",\"162\",\"174\",\"189\",\"190\",\"191\",\"192\",\"193\",\"194\",\"195\",\"196\",\"197\",\"198\",\"199\",\"188\",\"187\",\"176\",\"177\",\"178\",\"179\",\"180\",\"181\",\"182\",\"183\",\"184\",\"185\",\"186\",\"200\",\"201\",\"214\",\"213\",\"212\",\"211\",\"210\",\"209\",\"208\",\"207\",\"206\",\"205\",\"204\",\"203\",\"202\",\"215\",\"226\",\"227\",\"228\",\"229\",\"230\",\"231\",\"232\",\"233\",\"225\",\"224\",\"216\",\"217\",\"218\",\"219\",\"220\",\"221\",\"222\",\"223\",\"234\",\"246\",\"247\",\"248\",\"249\",\"250\",\"251\",\"252\",\"253\",\"245\",\"244\",\"243\",\"235\",\"236\",\"237\",\"238\",\"239\",\"240\",\"241\",\"242\",\"254\",\"255\",\"256\",\"266\",\"265\",\"264\",\"263\",\"262\",\"261\",\"260\",\"259\",\"258\",\"257\",\"267\",\"279\",\"280\",\"281\",\"282\",\"283\",\"284\",\"285\",\"286\",\"287\",\"278\",\"277\",\"268\",\"269\",\"270\",\"271\",\"272\",\"273\",\"274\",\"275\",\"276\",\"288\",\"289\",\"290\",\"291\",\"321\",\"322\",\"323\",\"335\",\"336\",\"337\",\"338\",\"339\",\"340\",\"341\",\"342\",\"343\",\"344\",\"334\",\"333\",\"332\",\"324\",\"325\",\"326\",\"327\",\"328\",\"329\",\"330\",\"331\",\"345\",\"354\",\"355\",\"356\",\"357\",\"358\",\"359\",\"353\",\"352\",\"351\",\"350\",\"349\",\"348\",\"347\",\"346\",\"360\",\"28\",\"319\",\"318\",\"317\",\"316\",\"312\",\"313\",\"314\",\"315\"]', '[4]', 0, 'obAZ5D0q21t2nbXK9mw7kfjJO3ds8Ftu.png', 1),
(19, 9, 'computer', 'computer', 'computer@hotmail.com', 'computer@hotmail.com', 1, NULL, '$2y$13$i5K0/rrVwu9pLcX7dTWBZOrUEaAoDm2FtCs40mNpRTiYjKh1fvrM6', '2018-07-10 08:00:27', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\"]', '[4]', 0, '5GzSTkpPsJSV7TI16WTmib72M8nc9PON.png', 1),
(20, 10, 'andrea', 'andrea', 'Andrea@hotmail.com', 'andrea@hotmail.com', 1, NULL, '$2y$13$ODq/zsmqXYkPm8tYo9GUc.23GHrPA.UEkzQNfvsttoxdPX09jHXZ2', '2018-10-30 01:04:54', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"44\",\"41\",\"40\",\"39\",\"45\",\"46\",\"47\",\"48\",\"52\",\"51\",\"50\",\"49\",\"38\",\"37\",\"7\",\"8\",\"3\",\"29\",\"30\",\"31\",\"32\",\"33\",\"34\",\"35\",\"36\",\"5\",\"108\",\"109\",\"110\",\"111\",\"112\",\"113\",\"104\",\"103\",\"102\",\"93\",\"94\",\"95\",\"96\",\"97\",\"98\",\"99\",\"100\",\"101\",\"114\",\"166\",\"167\",\"168\",\"169\",\"170\",\"171\",\"172\",\"173\",\"165\",\"164\",\"163\",\"155\",\"156\",\"157\",\"158\",\"159\",\"160\",\"161\",\"162\",\"174\",\"227\",\"228\",\"229\",\"230\",\"231\",\"232\",\"233\",\"225\",\"224\",\"216\",\"217\",\"218\",\"219\",\"220\",\"221\",\"222\",\"223\",\"234\",\"281\",\"282\",\"283\",\"284\",\"285\",\"286\",\"287\",\"278\",\"277\",\"268\",\"269\",\"270\",\"271\",\"272\",\"273\",\"274\",\"275\",\"276\",\"288\",\"289\",\"290\",\"291\",\"355\",\"356\",\"357\",\"358\",\"359\",\"353\",\"352\",\"351\",\"350\",\"349\",\"348\",\"347\",\"346\",\"360\"]', '[4,5,6,7,8,9,10]', 0, '5WqRWO4SAIhUbBRvuJJdN0SwMnYlau7a.png', 1),
(21, 11, 'Andres06', 'andres06', 'gandresr06@gmail.com', 'gandresr06@gmail.com', 1, NULL, '$2y$13$Gjvxuj0Mzrf6IEs8y4HEVuHl0YLFYr4p3tH5hdBLAydCJXr.Lpqxy', '2018-07-16 15:17:06', NULL, NULL, 'a:0:{}', '[\"19\",\"20\"]', '[4]', 0, 'THPSASW8ACPGQsLd1IJpvVYvIdQ0XZ5a.png', 1),
(22, 12, 'jennymy', 'jennymy', 'yenniyela2000@gmail.com', 'yenniyela2000@gmail.com', 1, NULL, '$2y$13$170wkRym62FeKn9zk0q7qeJhSeE29hRwVgq2veqIt2cQU346IHnhS', '2018-07-30 19:45:20', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\"]', '[4]', 0, 'anonimo.jpg', 1),
(23, 13, 'bela', 'bela', 'bela@hotmail.com', 'bela@hotmail.com', 1, NULL, '$2y$13$Fv/5tRELBKOeu.DIPntDX..wW5CEjnOyYJFJs.pM3S3ijmKznR5ea', '2018-09-24 00:18:33', NULL, NULL, 'a:0:{}', '[\"19\",\"20\"]', '[4]', 0, 'anonimo.jpg', 1),
(24, 14, 'mbastidas', 'mbastidas', 'mateobastidas@gmail.com', 'mateobastidas@gmail.com', 1, NULL, '$2y$13$ON5Z2yQpEBpt5Ra3.iwCsuXeWxApG/h6OWH3rlIGKfElKbkElrDE2', '2018-09-24 00:32:45', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\"]', '[4]', 0, 'anonimo.jpg', 1),
(25, 15, 'dquiceno', 'dquiceno', 'dquiceno@test.com', 'dquiceno@test.com', 1, NULL, '$2y$13$.nbdclOmQQdXu1vBek3t9OB1e7k9pQh1YxiKKswySencBzbjfKJLm', '2019-02-12 17:12:02', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\",\"22\",\"23\",\"24\"]', '[4]', 0, 'JFhKKzUBxQaWhNOFKmhuatwyi5nBIPUD.png', 1),
(26, 16, 'reloj', 'reloj', 'Reloj@solyLuna.com', 'reloj@solyluna.com', 1, NULL, '$2y$13$yDlel3IKRdvajXGfNXbgi.rTY2HkN3O3naHUNdnMqE9fghEu7Bf6m', '2019-01-30 22:48:51', NULL, NULL, 'a:0:{}', '[]', '[4]', 0, 'anonimo.jpg', 1),
(27, 17, 'yulis', 'yulis', 'yulis@hotmail.es', 'yulis@hotmail.es', 1, NULL, '$2y$13$cB9Y5jiD1HjsVozyf73yM.HYj7B1ACGUsdHpWuIzzYr.Aa5btVKB6', '2018-12-27 19:43:13', NULL, NULL, 'a:0:{}', '[]', '[4]', 0, 'anonimo.jpg', 1),
(28, 18, 'jaramillo', 'jaramillo', 'jara@hotmail.com', 'jara@hotmail.com', 1, NULL, '$2y$13$JSLS5swSpCcltOTR12.y5uy7CVBS49jckZ8M1fsoSpRv1GjeEBpLa', '2018-12-31 20:27:48', NULL, NULL, 'a:0:{}', '[\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"26\",\"27\",\"16\",\"15\",\"14\",\"13\",\"12\",\"11\",\"4\",\"6\",\"44\",\"41\"]', '[4]', 0, 'anonimo.jpg', 0),
(29, 19, 'rtest', 'rtest', 'rtest@hotmail.es', 'rtest@hotmail.es', 1, NULL, '$2y$13$5f6rGPMokoz0LcdGFOBOF.J7nFEiNnG6HujArvXEg.4mV8GHhf80u', '2019-02-13 23:17:34', NULL, NULL, 'N;', '[]', '[4]', 0, 'anonimo.jpg', 1),
(30, 20, 'rtest2', 'rtest2', 'rtest2@hotmail.com', 'rtest2@hotmail.com', 1, NULL, '$2y$13$JgCK02N5DlVSM0yRJTNfAui8xsFiTeaRSc5ICkAOZuTuVwICcrrYm', '2019-02-14 14:37:18', NULL, NULL, 'N;', '[\"19\",\"20\",\"21\"]', '[4]', 0, 'anonimo.jpg', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_data`
--

CREATE TABLE `user_data` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user_data`
--

INSERT INTO `user_data` (`id`, `email`, `username`, `password`) VALUES
(1, 'diegofernando150_@hotmail.es', 'dbastidas150', '123'),
(2, 'dbastidas@cc.com', 'dbastidas123', '123'),
(3, 'diego.fernando.bastidas@correounivalle.edu', 'wbastidas', '123'),
(4, 'jbastidas@correounivalle.edu.co', 'jbastidas', '123'),
(5, 'random@correounivalle.edu.co', 'random', '123'),
(6, 'test@correounivalle.edu.co', 'test', '123'),
(7, 'diegofernando150_@hotmail.es', 'dbastidas150', '123'),
(8, 'diegofernando150_@hotmail.es', 'dbastidas150', '123'),
(9, 'maurobastidas@hotmail.com', 'mauro', '123'),
(10, 'dahiana@gmail.com', 'dahiana', '123'),
(11, 'test@correounivalle.edu.co', 'test', '123'),
(12, 'diana.jaramillo@live.com', 'Djaramillo', '123'),
(13, 'nandreach@hotmail.com', 'ncalero', '123'),
(14, 'computer@hotmail.com', 'computer', '123'),
(15, 'Andrea@hotmail.com', 'andrea', '123'),
(16, 'gandresr06@gmail.com', 'Andres06', '12345'),
(17, 'yenniyela2000@gmail.com', 'jennymy', '1004598699'),
(18, 'bela@hotmail.com', 'bela', '123'),
(19, 'mateobastidas@gmail.com', 'mbastidas', '123'),
(20, 'dquiceno@test.com', 'dquiceno', '123'),
(21, 'Reloj@solyLuna.com', 'reloj', '123'),
(22, 'yulis@hotmail.es', 'yulis', '123'),
(23, 'jara@hotmail.com', 'jaramillo', '123'),
(24, 'rtest@hotmail.es', 'rtest', '123'),
(25, 'rtest2@hotmail.com', 'rtest2', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_statistics`
--

CREATE TABLE `user_statistics` (
  `id` int(11) NOT NULL,
  `trying` int(11) NOT NULL,
  `error_rate` int(11) NOT NULL,
  `success_rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user_statistics`
--

INSERT INTO `user_statistics` (`id`, `trying`, `error_rate`, `success_rate`) VALUES
(1, 1380, 196, 1187),
(2, 16, 1, 15),
(4, 8, 2, 6),
(5, 4, 0, 4),
(6, 7, 2, 5),
(7, 26, 0, 26),
(8, 408, 78, 366),
(9, 7, 0, 7),
(10, 129, 8, 121),
(11, 3, 1, 2),
(12, 4, 1, 3),
(13, 3, 1, 2),
(14, 3, 0, 3),
(15, 6, 0, 6),
(16, 0, 0, 0),
(17, 0, 0, 0),
(18, 20, 1, 19),
(19, 0, 0, 0),
(20, 3, 0, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog_article`
--
ALTER TABLE `blog_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EECCB3E53397707A` (`categoria_id`);

--
-- Indices de la tabla `blog_category`
--
ALTER TABLE `blog_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comunity_answer`
--
ALTER TABLE `comunity_answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_246DA35831A5801E` (`pregunta_id`),
  ADD KEY `IDX_246DA358DB38439E` (`usuario_id`);

--
-- Indices de la tabla `comunity_question`
--
ALTER TABLE `comunity_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5B0EA99DB38439E` (`usuario_id`);

--
-- Indices de la tabla `globals_tips`
--
ALTER TABLE `globals_tips`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `practical_exercise`
--
ALTER TABLE `practical_exercise`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C36A4DF959027487` (`theme_id`);

--
-- Indices de la tabla `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D64992FC23A8` (`username_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649A0D96FBF` (`email_canonical`),
  ADD UNIQUE KEY `UNIQ_8D93D649C05FB297` (`confirmation_token`),
  ADD UNIQUE KEY `UNIQ_8D93D6499A2595B2` (`statistics_id`);

--
-- Indices de la tabla `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_statistics`
--
ALTER TABLE `user_statistics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog_article`
--
ALTER TABLE `blog_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `blog_category`
--
ALTER TABLE `blog_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comunity_answer`
--
ALTER TABLE `comunity_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `comunity_question`
--
ALTER TABLE `comunity_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `globals_tips`
--
ALTER TABLE `globals_tips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `practical_exercise`
--
ALTER TABLE `practical_exercise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=512;

--
-- AUTO_INCREMENT de la tabla `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `user_statistics`
--
ALTER TABLE `user_statistics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `blog_article`
--
ALTER TABLE `blog_article`
  ADD CONSTRAINT `FK_EECCB3E53397707A` FOREIGN KEY (`categoria_id`) REFERENCES `blog_category` (`id`);

--
-- Filtros para la tabla `comunity_answer`
--
ALTER TABLE `comunity_answer`
  ADD CONSTRAINT `FK_246DA35831A5801E` FOREIGN KEY (`pregunta_id`) REFERENCES `comunity_question` (`id`),
  ADD CONSTRAINT `FK_246DA358DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `comunity_question`
--
ALTER TABLE `comunity_question`
  ADD CONSTRAINT `FK_F5B0EA99DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `practical_exercise`
--
ALTER TABLE `practical_exercise`
  ADD CONSTRAINT `FK_C36A4DF959027487` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6499A2595B2` FOREIGN KEY (`statistics_id`) REFERENCES `user_statistics` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
