# Code Weekly Challenge Swift/iOS 2022
## Proyecto de retos semanales de la comunidad **[MoureDev](https://moure.dev)** para practicar [Swift](https://github.com/apple/swift) e iOS.

![https://mouredev.com/discord](https://github.com/mouredev/mouredev/blob/master/mouredev_weekly_challenge.png)

Existen repositorios de código tanto para Swift/iOS como para Kotlin/Android en los que se publicarán semanalmente los mismos retos. Así podrás elegir el que mejor se adapta a tus necesidades (o practicar en ambos).

[![GitHub Followers](https://img.shields.io/github/stars/mouredev/Weekly-Challenge-2022-Swift?label=Repositorio%20público%20retos%20Swift/iOS&style=social)](https://github.com/mouredev/Weekly-Challenge-2022-Swift)
[![GitHub Followers](https://img.shields.io/github/stars/mouredev/Weekly-Challenge-2022-Kotlin?label=Repositorio%20público%20retos%20Kotlin/Android&style=social)](https://github.com/mouredev/Weekly-Challenge-2022-Kotlin)

### Requisitos mínimos
[![Swift](https://img.shields.io/badge/Swift-5-orange.svg?longCache=true&style=popout-square)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-13-blue.svg?longCache=true&style=popout-square)](https://developer.apple.com/xcode)
[![iOS](https://img.shields.io/badge/iOS-15-red.svg?longCache=true&style=popout-square)](https://www.apple.com/es/ios)

## Vídeo explicación retos

<a href="https://youtu.be/14v4IINunvY"><img src="http://i3.ytimg.com/vi/14v4IINunvY/maxresdefault.jpg" style="height: 50%; width:50%;"/></a>

## Listado de retos
* **#0** - 27/12/21 - `EL FAMOSO "FIZZ BUZZ"`
* **#1** - 03/01/22 - `¿ES UN ANAGRAMA?`
* **#2** - 10/01/22 - `LA SUCESIÓN DE FIBONACCI`
* **#3** - 17/01/22 - `¿ES UN NÚMERO PRIMO?`
* **#4** - 24/01/22 - `ÁREA DE UN POLÍGONO`
* **#5** - 01/02/22 - `ASPECT RATIO DE UNA IMAGEN`
* **#6** - 07/02/22 - `INVIRTIENDO CADENAS`
* **#7** - 14/02/22 - `CONTANDO PALABRAS`
* **#8** - 18/02/22 - `DECIMAL A BINARIO`
* **#9** - 02/03/22 - `CÓDIGO MORSE`
* **#10** - 07/03/22 - `EXPRESIONES EQUILIBRADAS`
* **#11** - 14/03/22 - `ELIMINANDO CARACTERES`
* **#12** - 21/03/22 - `¿ES UN PALÍNDROMO?`
* **#13** - 28/03/22 - `FACTORIAL RECURSIVO`
* **#14** - 04/04/22 - `Publicación nuevo reto...`

### ¿Cómo puedo participar?

**Puedes hacer libremente un fork del proyecto y trabajar con Git para ir sincronizando las actualizaciones del proyecto.**

* Cada lunes se publicará un nuevo reto de código.
* Cada reto será un nuevo fichero dentro de `WeeklyChallenge2022.playground` donde se indicará la fecha, el enunciado y la información necesaria para llevarlo a cabo.
* Se comunicará en el canal `#🔁reto-semanal` de [Discord](https://mouredev.com/discord), en directo desde [Twitch](https://twitch.tv/mouredev) y se subirá el enunciado al [repositorio](https://github.com/mouredev/Weekly-Challenge-2022-Swift).
* Dispondrás de una semana para resolverlo, preguntar tus dudas, debatir y aportar ayuda en el canal de Discord.
* El lunes siguiente se subirá la resolución al repositorio, se comentará en directo desde Twitch (utilizando alguna solución de entre los asistentes o que se haya realizado una pull request al proyecto) y se añadirá el nuevo reto semanal.
* Comenzará de nuevo el proceso.

	*Si no dispones de un editor de código como Xcode, puedes usar un playground online ([http://online.swiftplayground.run/](http://online.swiftplayground.run/)) para probar tu código.*
	
	*Si utilizas un editor como Xcode, puedes ejecutar el código pulsando el símbolo "play ►" en el lateral.*

Si quieres unirte a nuestra comunidad de desarrollo, aprender programación de Apps, mejorar tus habilidades y ayudar a la continuidad del proyecto, puedes encontrarnos en:

[![Twitch](https://img.shields.io/badge/Twitch-Retos_en_directo-9146FF?style=for-the-badge&logo=twitch&logoColor=white&labelColor=101010)](https://twitch.tv/mouredev)
[![Discord](https://img.shields.io/badge/Discord-Canal_de_chat_para_retos-5865F2?style=for-the-badge&logo=discord&logoColor=white&labelColor=101010)](https://mouredev.com/discord)
[![Link](https://img.shields.io/badge/Links_de_interés-moure.dev-39E09B?style=for-the-badge&logo=Linktree&logoColor=white&labelColor=101010)](https://mouredev.com)

### Cómo trabajar con Git y GitHub de forma colaborativa

Deberás realizar flujos de actualización, sincronización y `pull request` desde tu `fork` del proyecto hacia el principal (habitualmente nombrado como `upstream/main`).
Todo esto se puede hacer desde línea de comandos, pero si prefieres puedes usar clientes gráficos como [GitHub Desktop](https://desktop.github.com/) (muy simple) o [GitKraken](https://www.gitkraken.com/invite/cZWhJq1v) (más avanzado y potente).

* Desde tu repo en la propia web de GitHub podrás realizar muchas acciones.
* Si te resulta más fácil, puedes crear una `branch`(rama) para resolver cada reto y así simplificar la `pull request`. También puedes ignorar ciertos ficheros.
* Resuelve el ejercicio y realiza `commit` y `push` del mismo a tu proyecto.
* Desde GitHub, una vez hecho el `fork` verás opciones como "Contribute" o "Fetch upstream":
	* `Contribute` permite abrir una `pull request`(deberás seleccionar el mío como repositorio base contra el que comparar tu proyecto). Así yo podré ver los ficheros modificados de tu proyecto con la solución a los retos. Intenta que el título de la `pull request` siga esta convención: **"Solución Reto #[número del reto]" (Solución Reto #0)**. 
	* `Fetch upstream` permite sincronizar tu proyecto con el original en caso de que se haya actualizado.
* Para sincronizar tu proyecto con el original y mantenerlo actualizado también puedes hacer un `merge commit`, `squash merge` o `rebase`(ten en cuenta que cada uno se comporta de una manera, conservando o no tus propios cambios).
* Una vez se publique el nuevo reto, la solución del anterior, y comente las soluciones, cerraré las pasadas `pull request` para dejar paso a las que se hagan para el nuevo reto.

## ![https://mouredev.com](https://raw.githubusercontent.com/mouredev/mouredev/master/mouredev_emote.png) Hola, mi nombre es Brais Moure.
### Freelance full-stack iOS & Android engineer

[![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCxPD7bsocoAMq8Dj18kmGyQ?style=social)](https://youtube.com/mouredevapps?sub_confirmation=1)
[![Twitch Status](https://img.shields.io/twitch/status/mouredev?style=social)](https://twitch.com/mouredev)
[![Twitter Follow](https://img.shields.io/twitter/follow/mouredev?style=social)](https://twitter.com/mouredev)
![GitHub Followers](https://img.shields.io/github/followers/mouredev?style=social)

Soy ingeniero de software desde hace más de 11 años. Desde hace 3 años combino mi trabajo desarrollando Apps con creación de contenido formativo sobre programación y tecnología en diferentes redes sociales como **[@mouredev](https://moure.dev)**.

### En mi perfil de GitHub tienes más información

[![Web](https://img.shields.io/badge/GitHub-MoureDev-14a1f0?style=for-the-badge&logo=github&logoColor=white&labelColor=101010)](https://github.com/mouredev)