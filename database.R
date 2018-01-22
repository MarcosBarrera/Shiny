
### Archivo para cargar MNIST database

data_images = gzfile("t10k-images-idx3-ubyte.gz" , "rb")
readBin(data_images, integer(), n=4, endian="big")

# Creamos la lista vacia donde se guardaran las imagenes al hacer el bucle
imagenes <- list()

# Loop para ver las imagenes
a = for(i in 1:500){
  m = matrix(readBin(data_images, 
                     integer(), 
                     size = 1, 
                     n = 28*28, 
                     endian = "big"),
             28,28);
  imagenes[[i]] <- (m[,28:1])
}

# El archivo con las labels
labels_data = gzfile("t10k-labels-idx1-ubyte.gz" , "rb")
readBin(labels_data, integer(), n=2, endian="big")

# Loop para leer las labels
labels = readBin(labels_data,integer(), 
                 size=1, 
                 n=500, 
                 endian="big")

# Numero aleatorio. Debe ir aqui para generar la primera imagen. Le asignamos valor a para poder cambiarlo despues
#a = sample(500, 1)