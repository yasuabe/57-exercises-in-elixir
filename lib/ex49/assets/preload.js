const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('electronAPI', {
  searchImages: (searchTerm) => {
    ipcRenderer.send('search-images', searchTerm);
  },
  onMessage: (callback) => {
    ipcRenderer.on('message-from-elixir', (_event, data) => {
      callback(data);
    });
  },
});
