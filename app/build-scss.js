const sass = require('sass');
const fs = require('fs');
const path = require('path');

const srcDir = path.join(__dirname, 'resources/style');
const destDir = path.join(__dirname, 'public/css');

// Создаем папку назначения, если её нет
if (!fs.existsSync(destDir)) {
    fs.mkdirSync(destDir, { recursive: true });
}

// Функция для компиляции одного файла
function compileFile(fileName) {
    if (!fileName.endsWith('.scss') || fileName.startsWith('_')) return;

    const srcPath = path.join(srcDir, fileName);
    const destPath = path.join(destDir, fileName.replace('.scss', '.css'));

    try {
        const result = sass.compile(srcPath);
        fs.writeFileSync(destPath, result.css);
        console.log(`Successfully compiled: ${fileName} -> ${path.basename(destPath)}`);
    } catch (err) {
        console.error(`Error compiling ${fileName}:`, err.message);
    }
}

// Основная функция сборки
function build() {
    console.log('Starting SCSS build...');
    fs.readdir(srcDir, (err, files) => {
        if (err) {
            console.error('Could not list the directory.', err);
            process.exit(1);
        }

        files.forEach(compileFile);
        console.log('Build finished!');
    });
}

// Запуск сборки
build();
