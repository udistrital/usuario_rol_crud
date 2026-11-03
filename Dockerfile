# Imagen base de runtime Distroless (Debian 12), variante :nonroot.
# - :nonroot ejecuta el proceso como usuario sin privilegios y recibe los
#   parches de CA (ca-certificates) y del SO publicados por GoogleContainerTools.
# - El binario se compila aparte con el toolchain Go 1.27.3 parcheado
#   (CVE-2026-111943, crypto/x509). Ver .drone.yml y README.md.
#
# Recomendado para builds reproducibles: fijar por digest, p. ej.
#   FROM gcr.io/distroless/base-debian12:nonroot@sha256:<digest-resuelto-en-build>
# Resolver el digest actual con:
#   docker pull gcr.io/distroless/base-debian12:nonroot
#   docker inspect --format='{{index .RepoDigests 0}}' gcr.io/distroless/base-debian12:nonroot
#
# Siguiente paso documentado: migrar a gcr.io/distroless/base-debian13:nonroot
# (Debian 13 / trixie) previa validación de arranque en ambiente de pruebas.
FROM gcr.io/distroless/base-debian12:nonroot
WORKDIR /
COPY main main
COPY conf/app.conf conf/app.conf
ENTRYPOINT ["/main"]
