import discord


class Client(discord.Client):
    def __init__(self):
        super().__init__()

    async def on_ready(self):
        game = discord.Game(name="In code we trust")
        await self.change_presense(status=discord.Status.online, activity=game)

    async def on_message(self, message):
        if message.author == client.user:
            return

        if message.content == "In code":
            await message.channel.send("We trust")

        if message.content == "ping":
            await message.channel.send("pong")


if __name__ == "__main__":
    client = Client()
    with open("./password.txt", "r") as f:
        client.run(f.readline().strip())
