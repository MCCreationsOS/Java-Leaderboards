const fs = require("fs")
const readline = require("readline")

const MAX_TIME = 360_000;

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function generateSubmissionFunctions(type, slug, message_text, formatting) {
    bt(0, MAX_TIME, "data/mccreations/function/leaderboards/submit/gen", type, slug, message_text, formatting);
    fs.writeFile("data/mccreations/function/leaderboards/submit/gen.mcfunction", `execute if score @s MCCreations.Leaderboards.Time matches 0..360000 run function mccreations:leaderboards/submit/gen/node`, () => {});
}

function bt(min, max, path, type, slug, message_text, formatting) {
    let text = ""
    if(max - min < 200) {
        for(let i = min; i <= max; i++) {
            text += `execute if score @s MCCreations.Leaderboards.Time matches ${i} run tellraw @s [{"text":"${message_text}", ${formatting} "clickEvent": {"action": "open_url", "value": "https://mccreations.net/leaderboards/submit?type=${type}&slug=${slug}&time=${i}"}}]\n`
        }
        try {
            fs.mkdirSync(path, {recursive: true})
        } catch (e) {
            if(e.code !== "EEXIST") {
                throw e;
            }
        }
        fs.writeFile(path + `/node.mcfunction`, text, () => {});
    } else {
        let mid = Math.floor((min + max) / 2);
        try {
            fs.mkdirSync(path, {recursive: true})
        } catch (e) {
            if(e.code !== "EEXIST") {
                throw e;
            }
        }

        text = `tellraw @a[tag=mccreations_leaderboards_debug] [{"text":"${path}","color":"green"}]\n`
        text += `execute if score @s MCCreations.Leaderboards.Time matches ${min}..${mid} run function mccreations:leaderboards/submit/${path}/${min}_${mid}/node\n`
        text += `execute if score @s MCCreations.Leaderboards.Time matches ${mid+1}..${max} run function mccreations:leaderboards/submit/${path}/${mid+1}_${max}/node`

        fs.writeFile(path + `/node.mcfunction`, text, () => {});
        bt(min, mid, path + `/${min}_${mid}`, type, slug, message_text, formatting);
        bt(mid+1, max, path + `/${mid+1}_${max}`, type, slug, message_text, formatting);
    }
}

rl.question("Enter the type of creation you're adding the leaderboard to (map, datapack): \n", (type) => {
    rl.question("\nEnter the MCCreations slug of the creation you're adding the leaderboard to. \nIf your creation is not on MCCreations just make sure this slug is not in use already on MCCreations \n", (slug) => {
        rl.question("\nEnter the message to be displayed when players submit their scores: \n", (message_text) => {
            rl.question("\nEnter any extra formatting to add to the tellraw: \nThis is formatted like \"color\":\"green\", \"bold\": true,\nNote the comma at the end.\n", (formatting) => {
                rl.write("Setting up the pack...\n");
                generateSubmissionFunctions(type, slug, message_text, formatting);

                rl.question("Setup complete! Would you like to delete this setup script? (y/n)\n", (answer) => {
                    if(answer === "y") {
                        fs.unlink(".gitattributes", () => {});
                        fs.unlink(".gitignore", () => {});
                        fs.unlink("README.md", () => {});
                        fs.unlink("setup.js", () => {});
                    }
                })

                rl.close();
            });
        });
    });
});