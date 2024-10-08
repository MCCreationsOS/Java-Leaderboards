const fs = require("fs")
const readline = require("readline")

const MAX_TIME = 360_000;

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function generateSubmissionFunctions(type, slug, message_text, formatting, score_type) {
    bt(0, MAX_TIME, "data/mccreations/function/leaderboards/submit/gen", "gen", type, slug, message_text, formatting, score_type);
    fs.writeFile("data/mccreations/function/leaderboards/submit/gen.mcfunction", `execute if score @s MCCreations.Leaderboards.Score matches 0..360000 run function mccreations:leaderboards/submit/gen/node`, () => {});

    bt(0, MAX_TIME, "older_versions/data/mccreations/functions/leaderboards/submit/gen", "gen", type, slug, message_text, formatting, score_type);
    fs.writeFileSync("older_versions/data/mccreations/functions/leaderboards/submit/gen.mcfunction", `execute if score @s MCCreations.Leaderboards.Score matches 0..360000 run function mccreations:leaderboards/submit/gen/node`, () => {});
}

function bt(min, max, path, dataPath, type, slug, message_text, formatting, score_type) {
    let text = ""
    if(max - min < 200) {
        for(let i = min; i <= max; i++) {
            text += `execute if score @s MCCreations.Leaderboards.Score matches ${i} run tellraw @s [{"text":"${message_text}", ${formatting} "clickEvent": {"action": "open_url", "value": "https://mccreations.net/leaderboards/${type}s/${slug}/submit?time=${i}&score_type=${score_type}"}}]\n`
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
        text += `execute if score @s MCCreations.Leaderboards.Score matches ${min}..${mid} run function mccreations:leaderboards/submit/${dataPath}/${min}_${mid}/node\n`
        text += `execute if score @s MCCreations.Leaderboards.Score matches ${mid+1}..${max} run function mccreations:leaderboards/submit/${dataPath}/${mid+1}_${max}/node`

        fs.writeFile(path + `/node.mcfunction`, text, () => {});
        bt(min, mid, path + `/${min}_${mid}`, dataPath + `/${min}_${mid}`, type, slug, message_text, formatting);
        bt(mid+1, max, path + `/${mid+1}_${max}`, dataPath + `/${mid+1}_${max}`,type, slug, message_text, formatting);
    }
    return true
}

rl.question("Enter the type of creation you're adding the leaderboard to (map, datapack): \n", (type) => {
    rl.question("\nEnter the MCCreations slug of the creation you're adding the leaderboard to. \nIf your creation is not on MCCreations just make sure this slug is not in use already on MCCreations \n", (slug) => {
        rl.question("\nEnter the message to be displayed when players submit their scores: \n", (message_text) => {
            rl.question("\nEnter any extra formatting to add to the tellraw: \nThis is formatted like \"color\":\"green\", \"bold\": true,\nNote the comma at the end.\n", (formatting) => {
                rl.question("\nWhat kind of score would you like the leaderboard to track? (time, highest_score, lowest_score)\n", (score_type) => {
                    if(score_type !== "time") {
                        rl.write("For non-time based leaderboards you will need to manually give your players scores on the MCCreations.Leaderboards.Score objective.\n");
                    }
                    rl.write("Setting up the pack...\n");
                    generateSubmissionFunctions(type, slug, message_text, formatting, score_type);
    
                    rl.question("Setup complete! Would you like to delete this setup script? (y/n)\n", (answer) => {
                        if(answer === "y") {
                            fs.unlink(".gitattributes", () => {});
                            fs.unlink(".gitignore", () => {});
                            fs.unlink("README.md", () => {});
                            fs.unlink("setup.js", () => {});
                        }
                        rl.close();
                    })
                })

            });
        });
    });
});