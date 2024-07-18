const { exec } = require('child_process');

const project_json = 'dev'
const currentDir = __dirname;

const runCommand = (command, callback, finish) => {
    exec(`powershell.exe -NoProfile -Command "${command}"`, { cwd: currentDir }, (error) => {
        if (error) {
            console.error(`Error executing command "${command}":`, error);
            return;
        }
        if (callback) callback();
        if (finish) console.log('Generated new package types; finished job');
    });
};

const install = 'wally install';
const sourcemap = `argon sourcemap "${project_json}".project.json --output sourcemap.json`;
const package_types = 'wally-package-types --sourcemap sourcemap.json Packages/'

runCommand(install, () => {
    console.log("Installed packages")
    runCommand(sourcemap, () => {
        console.log("Generated new sourcemap")
        runCommand(package_types, null, true)
    });
});