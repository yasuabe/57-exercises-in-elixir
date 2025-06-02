const { app, BrowserWindow, ipcMain } = require('electron');

const WINDOW_CONFIG = {
  width: 800,
  height: 600,
  webPreferences: {
    nodeIntegration: true,
    contextIsolation: false, // For simplicity in this example
  }
};
const MESSAGE_TYPES = {
  SEARCH: 'search',
  EXIT:   'exit',
};

let mainWindow;

const createMessage = (cmd, data = {}) => ({ cmd, ...data});
const sendToElixir = (message) => {
  process.stdout.write(JSON.stringify(message) + '\n');
};

const setupStdinListener = () => {
  process.stdin.setEncoding('utf8');
  process.stdin.on('data', (data) => {
    const { res, payload } = JSON.parse(data.trim());
    if (res === MESSAGE_TYPES.SEARCH) {
      mainWindow.webContents.send('message-from-elixir', payload);
    }
  });
};
const setupIpcHandlers = () => {
  ipcMain.on('search-images', (event, searchTerm) => {
    const searchCommand = createMessage(MESSAGE_TYPES.SEARCH, { tags: searchTerm });
    sendToElixir(searchCommand);
  });
}
const setupExitHandler = () => {
  mainWindow.on('close', () => {
    const exitCommand = createMessage(MESSAGE_TYPES.EXIT);
    sendToElixir(exitCommand);
  });
}

app.on('ready', () => {
  mainWindow = new BrowserWindow(WINDOW_CONFIG);

  mainWindow.loadFile('index.html');
  setupStdinListener();
  setupIpcHandlers();
  setupExitHandler();
});