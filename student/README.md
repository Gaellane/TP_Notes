
# restmongo

API REST Spring Boot + MongoDB (Gradle) avec Swagger UI.

## En utilisant Docker
Dans le terminal

```bash
docker compose up --build
```
Puis ouvre :
- http://localhost:8080/swagger-ui.html￼
- ou http://localhost:8080/api/users

Pour tout arreter ou nettoyer

```bash
docker compose down -v
```

## Prérequis (sans Docker)
- Java 17+
- MongoDB en local (URI: `mongodb://localhost:27017/testdb`)
- Gradle installé localement (`gradle -v`)

## Démarrer

```bash
gradle bootRun
```

Swagger UI: <http://localhost:8080/swagger-ui.html>

## Endpoints
- `GET /api/users`
- `POST /api/users`
- `PUT /api/users/{id}`
- `DELETE /api/users/{id}`

## Exemple de POST
```bash
curl -X POST http://localhost:8080/api/users \  -H "Content-Type: application/json" \  -d '{"nom":"Rojo","email":"rojo@itu.mg"}'
```

> Note: Le projet n'inclut pas le *Gradle Wrapper* pour rester léger. Si vous souhaitez l'ajouter :  
> `gradle wrapper --gradle-version 8.10.2` puis utilisez `./gradlew bootRun`.

## export et import image
Exporter
```bash
docker save -o mongo7.tar mongo:7
docker save -o eclipse-temurin17.tar eclipse-temurin:17-jdk
docker save -o gradle8.tar gradle:8.10.2-jdk17
```

dans la nouvelle machine , importer
```bash
docker load -i mongo7.tar
docker load -i eclipse-temurin17.tar
docker load -i gradle8.tar
```

Vérifier avec
```bash
docker images
```

