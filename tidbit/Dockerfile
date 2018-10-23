FROM ubuntu-pharo-seaside

RUN cp Pharo.image tidbit.image
RUN cp Pharo.changes tidbit.changes

RUN ./pharo tidbit.image eval --save \
"Metacello new \
    githubUser: 'yannij' project: 'Tidbit' commitish: 'master' path: 'src'; \
    baseline: 'Tidbit'; \
    onConflictUseIncoming; \
    onWarningLog; \
    load."

RUN ./pharo tidbit.image eval --save "ZnZincServerAdaptor startOn: 8080"

CMD ["./pharo", "tidbit.image", "--no-quit"]
