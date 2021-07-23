The spawning of the entities on the server is controlled in:
`7 Days To Die\Data\Config\spawning.xml`


```
 <biome name="forest">
	<spawn maxcount="2" respawndelay="3" time="Any" entitygroup="ZombiesAll" />
	<spawn maxcount="2" respawndelay="3" time="Night" entitygroup="ZombiesNight" />
	[color="#FF0000"]<spawn [color="#0000FF"]maxcount="1"[/color] [color="#FFFF00"]respawndelay="30"[/color] time="Any" entitygroup="AnimalsAll" spawnDeadChance="0" />[/color]
</biome>
```


"maxcount" is how many animals can spawn in one section. I would not change that.  

"respawndelay" is how long in game days after you kill the animal will another spawn. That is probably what you want to change by making it a lower number so when you kill an animal another will spawn sooner.  

You will need to go change that for every biome you want to increase the animal spawns in. This one above will just effect the "Forrest" biome  

 
### Refrence: https://community.7daystodie.com/topic/4157-animal-spawn-rate-and-amount-change/?tab=comments#comment-60925
