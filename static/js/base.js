function create_note_block(title, link) {
    return `
        <div class="notification">
            <h2 class="note-title">${title}</h2>
            <a class="note-link" href=${link}><h2>Перейти</h2></a>
        </div>
    `
}

function update_notes_count() {
    const span = document.getElementById('notes-count')
    const user_id = document.getElementById('user_id').value

    let xhr = new XMLHttpRequest()
    xhr.open('GET', `/get_notes_count/${user_id}`)
    xhr.send()
    xhr.responseType = 'json'

    xhr.onload = () => {
        let count = xhr.response['count']
        span.textContent = `(${count})`
    }
}

function show_notes() {
    const modal = document.getElementById('notes-modal')
    const user_id = document.getElementById('user_id').value

    update_notes_count()

    let xhr = new XMLHttpRequest()
    xhr.open('GET', `/get_notes/${user_id}`)
    xhr.send()
    xhr.responseType = 'json'

    xhr.onload = () => {
        console.log(xhr.response)
        xhr.response['notes'].forEach((note) => {
            modal.innerHTML += create_note_block(note['title'], note['link'])
        })
    }



    if (modal.style['display'] === 'none')
        modal.style['display'] = 'block'
    else
        modal.style['display'] = 'none'
}
