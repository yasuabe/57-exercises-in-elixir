const { app, BrowserWindow, ipcMain } = require('electron');

let mainWindow;

app.on('ready', () => {
  mainWindow = new BrowserWindow({
    width: 800,
    height: 600,
    webPreferences: {
      nodeIntegration: true,
      contextIsolation: false, // For simplicity in this example
    }
  });

  mainWindow.loadFile('index.html');

  process.stdin.setEncoding('utf8');
  process.stdin.on('data', (data) => {
    const { res, payload } = JSON.parse(data.trim());
    if (res === 'search') {
      mainWindow.webContents.send('message-from-elixir', payload);
    }
  });

  ipcMain.on('search-images', (event, searchTerm) => {
    const command = { cmd: "search", tags: searchTerm };
    process.stdout.write(JSON.stringify(command) + '\n');
    event.reply('search-results', `Results for: ${searchTerm}`);
  });

  mainWindow.on('close', () => {
    process.stdout.write('{"cmd":"exit"}\n');
  });
});